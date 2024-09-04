import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/addPic/addpicture_cubit.dart';
import 'package:news_app/Features/Search/Presentation/View/searchView.dart';
import 'package:news_app/main.dart';

class CustomeApbar extends StatelessWidget {
  const CustomeApbar({super.key});

  @override
  Widget build(BuildContext context) {
    var url = profilePic!.get('Url');
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.to(() => SearchView());
            },
            icon: SvgPicture.asset(
              Appassets.searchIcon,
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            )),
        Image.asset(
          Appassets.logo,
          width: 110,
          height: 40,
          fit: BoxFit.fitWidth,
        ),
        InkWell(
          onTap: () {
            Get.bottomSheet(Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey[900]),
                height: 100,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => IconButton(
                      onPressed: () {
                        BlocProvider.of<AddpictureCubit>(context)
                            .addPicture(camera: index == 0 ? true : false);
                      },
                      icon: Column(children: [
                        SvgPicture.asset(
                          index == 0 ? Appassets.camera : Appassets.gallery,
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          index == 0 ? Appstrings.camera : Appstrings.gallery,
                          style: AppfontStyle.introTitleStyle
                              .copyWith(color: Colors.white),
                        )
                      ])),
                  itemCount: 2,
                )));
          },
          child: BlocConsumer<AddpictureCubit, AddpictureState>(
            listener: (context, state) {
              if (state is AddpictureSuccess) {
                url = state.Url;
              }
            },
            builder: (context, state) {
              return CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage('${url == null ? Appassets.profile : url}'),
              );
            },
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
