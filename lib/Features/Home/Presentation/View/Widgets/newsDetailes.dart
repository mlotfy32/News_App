import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
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
      required this.discription});
  final String title;
  final String url;
  final String Url;
  final String auther;
  final String discription;
  final String name;
  final String content;
  final String publishedAt;
  final int Index;
  @override
  Widget build(BuildContext context) {
    String newTitle = '';
    bool translate = false;
    return SafeArea(
      child: Material(
        child: Container(
          child: ListView(
            children: [
              // Hero(
              //   tag: 'Url',
              //   child:
              Container(
                  height: 200,
                  width: helper().getscreenWidth(context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover),
                  )),
              // ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    ' $name',
                    style: AppfontStyle.mainTitle
                        .copyWith(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 12,
                    child: SvgPicture.asset(Appassets.earth),
                    backgroundColor: Colors.blue,
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.bookmark))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                ' Title',
                style: AppfontStyle.mainTitle
                    .copyWith(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                ' $title',
                style: AppfontStyle.mainTitle
                    .copyWith(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Text(
                ' News Content',
                style: AppfontStyle.mainTitle
                    .copyWith(fontSize: 19, fontWeight: FontWeight.w600),
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
                    ' ${translate == false ? content : newTitle} ',
                    style: AppfontStyle.mainTitle
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  );
                },
              ),

              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () async {
                      log('$Url');
                      final Uri url2 = Uri.parse('$Url');
                      await launchUrl(url2);
                    },
                    child: Text(
                      style: TextStyle(fontSize: 17),
                      '${Appstrings.seemore}',
                      textDirection: TextDirection.ltr,
                    )),
              ),

              Text(
                ' ${publishedAt.split(':')[0]}',
                style: AppfontStyle.mainTitle
                    .copyWith(color: Colors.blueGrey[800], fontSize: 17),
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
      ),
    );
  }
}
