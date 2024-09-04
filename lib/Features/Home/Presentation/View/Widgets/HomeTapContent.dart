import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/ChangeBody/changebidy_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/addPic/addpicture_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/CustomeAapBar.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/allNewsContent.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/customeTapBar.dart';

class HomeTapContent extends StatelessWidget {
  const HomeTapContent({super.key});

  @override
  Widget build(BuildContext context) {
    int CurrentIndex = 0;

    return Scaffold(
        body: Container(
      height: helper.getscreenHeight(context),
      width: helper.getscreenWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomeApbar(),
          Custometapbar(),
          BlocConsumer<ChangebidyCubit, ChangebidyState>(
            builder: (context, state) {
              return BlocProvider<TranslationCubit>(
                create: (context) => TranslationCubit(),
                child: Allnewscontent(),
              );
            },
            listener: (context, state) {
              if (state is Changebody) {
                CurrentIndex = state.Index;
              }
            },
          )
        ],
      ),
    ));
  }
}
