import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppColors.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Features/Home/Presentation/View/HomeView.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Sign_in_View.dart';
import 'package:news_app/main.dart';
import 'package:translator/translator.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pageView,
        onDone: () async {
          await isLogged!.setBool('logged', true);
          Get.offAll(() => FirebaseAuth.instance.currentUser == null
              ? SignInView()
              : Homeview());
        },
        onSkip: () async {
          await isLogged!.setBool('logged', true);

          Get.offAll(() => FirebaseAuth.instance.currentUser == null
              ? SignInView()
              : Homeview());
        },
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(22.0, 10.0),
          activeColor: Theme.of(context).primaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}

List<PageViewModel> pageView = [
  PageViewModel(
    title: Appstrings.titleList[0],
    body: Appstrings.descriptionList[0],
    image: Center(
      child: SvgPicture.asset(
        Appassets.introList[0],
        height: 175,
      ),
    ),
    decoration: const PageDecoration(
      pageColor: Appcolors.introBack,
      titleTextStyle: AppfontStyle.introTitleStyle,
      bodyTextStyle: AppfontStyle.introDescriptionStyle,
    ),
  ),
  PageViewModel(
    title: Appstrings.titleList[1],
    body: Appstrings.descriptionList[1],
    image: Center(
      child: SvgPicture.asset(
        Appassets.introList[1],
        height: 175,
      ),
    ),
    decoration: const PageDecoration(
      pageColor: Appcolors.introBack,
      titleTextStyle: AppfontStyle.introTitleStyle,
      bodyTextStyle: AppfontStyle.introDescriptionStyle,
    ),
  ),
  PageViewModel(
    title: Appstrings.titleList[2],
    body: Appstrings.descriptionList[2],
    image: Center(
      child: SvgPicture.asset(
        Appassets.introList[2],
        height: 175,
      ),
    ),
    decoration: const PageDecoration(
      pageColor: Appcolors.introBack,
      titleTextStyle: AppfontStyle.introTitleStyle,
      bodyTextStyle: AppfontStyle.introDescriptionStyle,
    ),
  ),
  PageViewModel(
    title: Appstrings.titleList[3],
    body: Appstrings.descriptionList[3],
    image: Center(
      child: SvgPicture.asset(
        Appassets.introList[3],
        height: 175,
      ),
    ),
    decoration: const PageDecoration(
      pageColor: Appcolors.introBack,
      titleTextStyle: AppfontStyle.introTitleStyle,
      bodyTextStyle: AppfontStyle.introDescriptionStyle,
    ),
  ),
];
