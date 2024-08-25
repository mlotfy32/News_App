import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/ChangeBody/changebidy_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/ChangeStateCubit/changestate_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/HomeTapContent.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({super.key});
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ChangestateCubit, ChangestateState>(
          listener: (context, state) {
            if (state is Changestate) {
              currentIndex = state.Index;
            }
          },
          builder: (context, state) {
            if (currentIndex == 2) {
              return Container();
            } else if (currentIndex == 1) {
              return Container();
            } else {
              return BlocProvider<ChangebidyCubit>(
                create: (context) => ChangebidyCubit(),
                child: HomeTapContent(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
          height: 56,
          width: helper().getscreenWidth(context),
          color: Colors.white,
          child: Row(
            children: Appassets.BottomNavigation.asMap().entries.map((e) {
              int index = e.key;
              return Expanded(
                child: InkWell(onTap: () {
                  BlocProvider.of<ChangestateCubit>(context)
                      .change(Index: index);
                }, child: BlocBuilder<ChangestateCubit, ChangestateState>(
                  builder: (context, state) {
                    return Column(children: [
                      SvgPicture.asset(
                        Appassets.BottomNavigation[index],
                        width: 70,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        Appstrings.BottomNavigationTitle[index],
                        style: AppfontStyle.introTitleStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      currentIndex == index
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              height: 4,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffFA7D23),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                            )
                          : AnimatedContainer(
                              duration: Duration(seconds: 0),
                              height: 5,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                            )
                    ]);
                  },
                )),
              );
            }).toList(),
          )),
    );
  }
}
