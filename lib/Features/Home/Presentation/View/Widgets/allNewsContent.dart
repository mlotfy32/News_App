import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/newsDetailes.dart';

class Allnewscontent extends StatelessWidget {
  const Allnewscontent({super.key});

  @override
  Widget build(BuildContext context) {
    int newIndex = 0;
    String newTitle = '';
    bool translate = false;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      width: helper().getscreenWidth(context),
      height: helper().getHeight(0.769, context),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              Appstrings.topNews,
              style: AppfontStyle.mainTitle,
            ),
          ),
          FutureBuilder<List<News>>(
            future: AppServices().getNews(
                'all', '${DateTime.now().year}', '${DateTime.now().month}'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                List<News> Data = snapshot.data!;
                return SizedBox(
                  width: helper().getscreenWidth(context),
                  height: helper().getHeight(0.769, context) - 27,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
                      itemCount: Data.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.to(
                                  () => BlocProvider<TranslationCubit>(
                                        create: (context) => TranslationCubit(),
                                        child: Newsdetailes(
                                            auther: Data[index].author,
                                            discription:
                                                Data[index].description,
                                            Url: Data[index].url,
                                            publishedAt:
                                                Data[index].publishedAt,
                                            Index: index,
                                            title: Data[index].title,
                                            url: Data[index].urlToImage,
                                            name: Data[index].name,
                                            content: Data[index].content),
                                      ),
                                  curve: Curves.easeInCirc,
                                  duration: const Duration(milliseconds: 400));
                            },
                            child: SizedBox(
                              height: 310,
                              width: helper().getscreenWidth(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Hero(
                                  //   tag: 'Url',
                                  //   child:
                                  Container(
                                      height: 160,
                                      width: helper().getscreenWidth(context),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                Data[index].urlToImage),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  // ),
                                  Text(
                                    Data[index].name,
                                    style: AppfontStyle.mainTitle.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 76,
                                        width: helper().getwidth(0.9, context),
                                        child: BlocConsumer<TranslationCubit,
                                            TranslationState>(
                                          listener: (context, state) {
                                            if (state is Translation) {
                                              newTitle = state.text;
                                              newIndex = state.index;
                                              translate = state.translat;
                                            }
                                          },
                                          builder: (context, state) {
                                            return Text(
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              translate == false
                                                  ? Data[index].title
                                                  : translate == translate &&
                                                          index == newIndex
                                                      ? newTitle
                                                      : Data[index].title,
                                              style: AppfontStyle.mainTitle
                                                  .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${Data[index].publishedAt.split(':')[0]}',
                                        style: AppfontStyle.mainTitle.copyWith(
                                            color: Colors.blueGrey[800],
                                            fontSize: 17),
                                      ),
                                      TextButton(
                                          onPressed: () async {
                                            BlocProvider.of<TranslationCubit>(
                                                    context)
                                                .translate(
                                                    Data[index]
                                                        .title
                                                        .toString(),
                                                    index);
                                          },
                                          child: Text(
                                            style: TextStyle(fontSize: 17),
                                            Appstrings.translate,
                                            textDirection: TextDirection.rtl,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                );
              } else {
                return Center(
                  child: Column(
                    children: [Lottie.asset(Appassets.noInterNet)],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
