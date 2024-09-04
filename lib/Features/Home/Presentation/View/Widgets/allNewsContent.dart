import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Core/Utiles/constans.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Add_To_Favorite/add_to_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/ChangeBody/changebidy_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/GetFavorite/get_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/CustomeContent.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/newsDetailes.dart';

class Allnewscontent extends StatelessWidget {
  const Allnewscontent({super.key});
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    String dataType = 'all';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      width: helper.getscreenWidth(context),
      height: helper.getHeight(0.769, context),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              Appstrings.topNews,
              style: AppfontStyle.mainTitle,
            ),
          ),
          BlocConsumer<ChangebidyCubit, ChangebidyState>(
            listener: (context, state) {
              if (state is Changebody) {
                currentIndex = state.Index;
              }
            },
            builder: (context, state) {
              return FutureBuilder<List<News>>(
                future: AppServices().getNews(
                    state is Changebody ? state.dataType : dataType,
                    '${DateTime.now().year}',
                    '${DateTime.now().month}'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: helper.getHeight(0.3, context)),
                      child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.blueAccent, size: 70),
                    );
                  } else if (snapshot.hasData) {
                    List<News> Data = snapshot.data!;
                    return SizedBox(
                        width: helper.getscreenWidth(context),
                        height: helper.getHeight(0.769, context) - 27,
                        child: ListView.separated(
                            separatorBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(),
                                ),
                            itemCount: Data.length,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () async {
                                  bool isContain = false;
                                  Box myBox;
                                  myBox = Hive.box(Constans.KBox);

                                  var x = await myBox.get(Data[index].title);
                                  isContain = x == null ? false : true;
                                  Get.to(
                                      () => MultiBlocProvider(
                                            providers: [
                                              BlocProvider<TranslationCubit>(
                                                create: (context) =>
                                                    TranslationCubit(),
                                              ),
                                              BlocProvider<AddToFavoriteCubit>(
                                                create: (context) =>
                                                    AddToFavoriteCubit(),
                                              ),
                                              BlocProvider<GetFavoriteCubit>(
                                                create: (context) =>
                                                    GetFavoriteCubit(),
                                              ),
                                            ],
                                            child: Newsdetailes(
                                                isContain: isContain,
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
                                      duration:
                                          const Duration(milliseconds: 400));
                                },
                                child: Customecontent(
                                  Data: Data,
                                  index: index,
                                  h: 310,
                                ))));
                  } else {
                    return Center(
                      child: Column(
                        children: [Lottie.asset(Appassets.noInterNet)],
                      ),
                    );
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
