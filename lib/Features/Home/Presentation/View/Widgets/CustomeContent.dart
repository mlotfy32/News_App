import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';

class Customecontent extends StatelessWidget {
  const Customecontent(
      {super.key, required this.Data, required this.index, required this.h});
  final List<News> Data;
  final int index;
  final double h;
  @override
  Widget build(BuildContext context) {
    int newIndex = 0;
    String newTitle = '';
    bool translate = false;

    return Material(
      color: Colors.white,
      child: SizedBox(
        height: h,
        width: helper.getscreenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero(
            //   tag: 'Url',
            //   child:
            Container(
                height: 160,
                width: helper.getscreenWidth(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Data[index].urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                )),
            // ),
            Row(
              children: [
                Text(
                  '${Data[index].name} ',
                  style: AppfontStyle.mainTitle
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  radius: 7,
                  child: SvgPicture.asset(Appassets.earth),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 76,
                  width: helper.getwidth(0.9, context),
                  child: BlocConsumer<TranslationCubit, TranslationState>(
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
                            : translate == translate && index == newIndex
                                ? newTitle
                                : Data[index].title,
                        style: AppfontStyle.mainTitle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Data[index].publishedAt.split(':')[0]}',
                  style: AppfontStyle.mainTitle
                      .copyWith(color: Colors.blueGrey[800], fontSize: 17),
                ),
                TextButton(
                    onPressed: () async {
                      BlocProvider.of<TranslationCubit>(context)
                          .translate(Data[index].title.toString(), index);
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
    );
  }
}
