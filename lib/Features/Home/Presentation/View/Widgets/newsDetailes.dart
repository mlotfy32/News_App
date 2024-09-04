import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Data/saveModel.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Add_To_Favorite/add_to_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class Newsdetailes extends StatelessWidget {
  const Newsdetailes(
      {super.key,
      required this.title,
      required this.url,
      required this.name,
      required this.content,
      required this.Index,
      required this.publishedAt,
      required this.Url,
      required this.auther,
      required this.discription,
      required this.isContain});
  final String title;
  final String url;
  final String Url;
  final String auther;
  final String discription;
  final String name;
  final String content;
  final String publishedAt;
  final int Index;
  final bool isContain;
  @override
  Widget build(BuildContext context) {
    String newTitle = '';
    bool translate = false;
    bool iscontain = isContain;
    return SafeArea(
      child: Material(
        child: Container(
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: helper.getscreenWidth(context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover),
                  )),
              Container(
                height: helper.getscreenHeight(context) - 236,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '$name  ',
                          style: AppfontStyle.mainTitle.copyWith(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        CircleAvatar(
                          radius: 10,
                          child: SvgPicture.asset(Appassets.earth),
                          backgroundColor: Colors.blue,
                        ),
                        Spacer(),
                        BlocConsumer<AddToFavoriteCubit, AddToFavoriteState>(
                          listener: (context, state) {
                            if (state is AddtofavoriteSuccess) {
                              iscontain = true;
                            }
                          },
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                  if (iscontain == true) {
                                  } else {
                                    BlocProvider.of<AddToFavoriteCubit>(context)
                                        .addToFavorite(
                                            SaveModel(
                                                author: auther,
                                                content: content,
                                                description: discription,
                                                name: name,
                                                publishedAt: publishedAt,
                                                title: title,
                                                url: Url,
                                                urlToImage: url,
                                                dateTime: DateTime.now()),
                                            title);
                                  }
                                },
                                icon: iscontain == true
                                    ? Icon(FontAwesomeIcons.solidBookmark)
                                    : Icon(FontAwesomeIcons.bookmark));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Title',
                      style: AppfontStyle.mainTitle
                          .copyWith(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '$title',
                      style: AppfontStyle.mainTitle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Appstrings.description,
                      style: AppfontStyle.mainTitle
                          .copyWith(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '$discription',
                      style: AppfontStyle.mainTitle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'News Content',
                      style: AppfontStyle.mainTitle
                          .copyWith(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    BlocConsumer<TranslationCubit, TranslationState>(
                      listener: (context, state) {
                        if (state is Translation) {
                          newTitle = state.text;
                          translate = state.translat;
                        }
                      },
                      builder: (context, state) {
                        return Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          '${translate == false ? content : newTitle}',
                          style: AppfontStyle.mainTitle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () async {
                            final Uri url2 = Uri.parse('$Url');
                            await launchUrl(url2);
                          },
                          child: Text(
                            style: TextStyle(fontSize: 17),
                            '${Appstrings.seemore}',
                            textDirection: TextDirection.ltr,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${publishedAt.split('T')[0]}',
                      style: AppfontStyle.mainTitle
                          .copyWith(color: Colors.blueGrey[800], fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Author',
                      style: AppfontStyle.mainTitle
                          .copyWith(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.at,
                          size: 20,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: helper.getscreenWidth(context) - 50,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            ' $auther',
                            style: AppfontStyle.mainTitle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () async {
                            BlocProvider.of<TranslationCubit>(context)
                                .translate(content.toString(), Index);
                          },
                          child: Text(
                            style: TextStyle(fontSize: 17),
                            Appstrings.translate,
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
