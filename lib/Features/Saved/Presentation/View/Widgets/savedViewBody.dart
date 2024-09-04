import 'dart:developer';
import 'dart:ui';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Core/Utiles/constans.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:news_app/Features/Home/Data/saveModel.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Add_To_Favorite/add_to_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/GetFavorite/get_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/newsDetailes.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/emailForm.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/signInButtons.dart';

class Savedviewbody extends StatefulWidget {
  const Savedviewbody({
    super.key,
    required this.saved,
    required this.Data,
  });

  final bool saved;
  final List<News> Data;

  @override
  State<Savedviewbody> createState() => _SavedviewbodyState();
}

class _SavedviewbodyState extends State<Savedviewbody> {
  @override
  void initState() {
    widget.saved == true
        ? BlocProvider.of<GetFavoriteCubit>(context).getFavorite()
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List data = widget.saved == true ? [] : widget.Data;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: widget.saved == true
            ? helper.getHeight(0.89, context)
            : helper.getscreenHeight(context) - 315,
        padding: EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.saved == true
                ? Text(
                    Appstrings.BottomNavigationTitle[2],
                    style: AppfontStyle.mainTitle.copyWith(fontSize: 23),
                  )
                : SizedBox(),
            SizedBox(
              height: widget.saved == true
                  ? helper.getHeight(0.84, context)
                  : helper.getscreenHeight(context) - 315,
              width: helper.getscreenWidth(context),
              child: BlocConsumer<GetFavoriteCubit, GetFavoriteState>(
                listener: (context, state) {
                  if (state is GetdataSuccess) {
                    data = [];
                    data.addAll(state.Data);
                    log('${data[0]}');
                  }
                },
                builder: (context, state) {
                  return state is GetFavoriteLoading
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: helper.getHeight(0.25, context),
                              right: helper.getwidth(0.3, context),
                              left: helper.getwidth(0.3, context)),
                          child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.blueAccent, size: 70),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(() => MultiBlocProvider(
                                        providers: [
                                          BlocProvider<AddToFavoriteCubit>(
                                            create: (context) =>
                                                AddToFavoriteCubit(),
                                          ),
                                          BlocProvider<TranslationCubit>(
                                            create: (context) =>
                                                TranslationCubit(),
                                          ),
                                        ],
                                        child: Newsdetailes(
                                            title: data[index].title,
                                            url: data[index].urlToImage,
                                            name: data[index].name,
                                            content: data[index].content,
                                            Index: index,
                                            publishedAt:
                                                data[index].publishedAt,
                                            Url: data[index].url,
                                            auther: data[index].author,
                                            discription:
                                                data[index].description,
                                            isContain: true),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 110,
                                      height: 110,
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 3),
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data[index].urlToImage),
                                                    fit: BoxFit.cover)),
                                          ),
                                          widget.saved == true
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 85),
                                                  child: ImageFiltered(
                                                    child: Container(
                                                      height: 15,
                                                      width: 98,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black
                                                              .withOpacity(0.3),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          15))),
                                                    ),
                                                    imageFilter:
                                                        ImageFilter.blur(
                                                            sigmaX: 3.0,
                                                            sigmaY: 3.5),
                                                  ),
                                                )
                                              : SizedBox(),
                                          widget.saved == true
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 80, left: 20),
                                                  child: SizedBox(
                                                    width: 90,
                                                    child: Text(
                                                      '${Jiffy.parse('${data[index].dateTime}').fromNow()}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppfontStyle
                                                          .introTitleStyle
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          helper.getscreenWidth(context) - 164,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].description,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppfontStyle.mainTitle
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          Text(
                                            data[index].title,
                                            overflow: TextOverflow.clip,
                                            maxLines: 2,
                                            style: AppfontStyle.introTitleStyle
                                                .copyWith(fontSize: 16),
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 7,
                                                child: SvgPicture.asset(
                                                    Appassets.earth),
                                                backgroundColor: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 90,
                                                child: Text(
                                                  data[index].name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppfontStyle
                                                      .introTitleStyle
                                                      .copyWith(fontSize: 16),
                                                ),
                                              ),
                                              Text(
                                                data[index]
                                                    .publishedAt
                                                    .split('T')[0],
                                                overflow: TextOverflow.ellipsis,
                                                style: AppfontStyle
                                                    .introTitleStyle
                                                    .copyWith(fontSize: 13),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    widget.saved == true
                                        ? IconButton(
                                            onPressed: () {
                                              log('======${data.length}');
                                              Get.defaultDialog(
                                                  content: Delete(
                                                saveModel: data[index],
                                                title: data[index].title,
                                              ));
                                              BlocProvider.of<GetFavoriteCubit>(
                                                      context)
                                                  .getFavorite();
                                            },
                                            icon: Icon(
                                              FontAwesomeIcons.trash,
                                              size: 20,
                                              color: Colors.black,
                                            ))
                                        : SizedBox(),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                          separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Divider(),
                              ),
                          itemCount: data.length);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Delete extends StatelessWidget {
  const Delete({super.key, required this.saveModel, required this.title});
  final SaveModel saveModel;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      child: Row(
        children: [
          Signinbuttons(
            text: 'Delete',
            onTap: () async {
              Box titleBox;
              titleBox = Hive.box(Constans.KBox);

              await saveModel.delete();
              await titleBox.delete('$title');

              Get.back();
            },
          )
        ],
      ),
    );
  }
}
