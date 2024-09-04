import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Add_To_Favorite/add_to_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/GetFavorite/get_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/newsDetailes.dart';
import 'package:news_app/Features/Saved/Presentation/View/SavedView.dart';
import 'package:news_app/Features/Saved/Presentation/View/Widgets/savedViewBody.dart';
import 'package:news_app/Features/Search/Presentation/ViewModel/GetSearch/get_search_cubit.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/emailForm.dart';

class Searchviewbody extends StatefulWidget {
  const Searchviewbody({
    super.key,
  });

  @override
  State<Searchviewbody> createState() => _SearchviewbodyState();
}

class _SearchviewbodyState extends State<Searchviewbody> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<News> Data = [];
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Emailform(
                email: false,
                onFieldSubmitted: (value) {
                  BlocProvider.of<GetSearchCubit>(context).search(q: value);
                },
                controller: textEditingController,
                icon: Icon(FontAwesomeIcons.faceSmile),
                title: Appstrings.search),
            SizedBox(
              height: helper.getHeight(0.84, context),
              width: helper.getscreenWidth(context),
              child: BlocConsumer<GetSearchCubit, GetSearchState>(
                listener: (context, state) {
                  if (state is GetSearchSuccess) {
                    Data = state.Data;
                  }
                },
                builder: (context, state) {
                  return state is GetSearchLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is GetSearchFailed
                          ? Center(
                              child: CircleAvatar(
                                radius: 20,
                              ),
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
                                                title: Data[index].title,
                                                url: Data[index].urlToImage,
                                                name: Data[index].name,
                                                content: Data[index].content,
                                                Index: index,
                                                publishedAt:
                                                    Data[index].publishedAt,
                                                Url: Data[index].url,
                                                auther: Data[index].author,
                                                discription:
                                                    Data[index].description,
                                                isContain: false),
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
                                                margin: const EdgeInsets.only(
                                                    right: 3),
                                                width: 110,
                                                height: 110,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            Data[index]
                                                                .urlToImage),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                                  imageFilter: ImageFilter.blur(
                                                      sigmaX: 3.0, sigmaY: 3.5),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 80, left: 20),
                                                child: SizedBox(
                                                  width: 90,
                                                  child: Text(
                                                    '${Jiffy.parse('${Data[index].publishedAt}').fromNow()}',
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
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              helper.getscreenWidth(context) -
                                                  164,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                Data[index].description,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppfontStyle.mainTitle
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              Text(
                                                Data[index].title,
                                                overflow: TextOverflow.clip,
                                                maxLines: 2,
                                                style: AppfontStyle
                                                    .introTitleStyle
                                                    .copyWith(fontSize: 16),
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 7,
                                                    child: SvgPicture.asset(
                                                        Appassets.earth),
                                                    backgroundColor:
                                                        Colors.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 90,
                                                    child: Text(
                                                      Data[index].name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppfontStyle
                                                          .introTitleStyle
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                  Text(
                                                    Data[index]
                                                        .publishedAt
                                                        .split('T')[0],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppfontStyle
                                                        .introTitleStyle
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                              separatorBuilder: (context, index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Divider(),
                                  ),
                              itemCount: Data.length);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
