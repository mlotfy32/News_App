import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/ChangeBody/changebidy_cubit.dart';

class Custometapbar extends StatelessWidget {
  const Custometapbar({super.key});

  @override
  Widget build(BuildContext context) {
    int CurrentIndex = 0;
    return SizedBox(
      width: helper.getwidth(0.7, context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Appstrings.TabBarTitle.asMap().entries.map((e) {
          int index = e.key;
          return InkWell(
            onTap: () {
              BlocProvider.of<ChangebidyCubit>(context).change(index: index);
            },
            child: BlocConsumer<ChangebidyCubit, ChangebidyState>(
              listener: (context, state) {
                if (state is Changebody) {
                  CurrentIndex = state.Index;
                }
              },
              builder: (context, state) {
                return Text(
                  Appstrings.TabBarTitle[index],
                  style: AppfontStyle.introTitleStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CurrentIndex == index
                          ? Colors.blueAccent
                          : Colors.black),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
