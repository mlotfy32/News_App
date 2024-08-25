import 'package:flutter/material.dart';
import 'package:news_app/Core/Utiles/AppColors.dart';

abstract class AppfontStyle {
  static const TextStyle introTitleStyle =
      TextStyle(fontSize: 18, color: Appcolors.introTitle);
  static const TextStyle introDescriptionStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Appcolors.introDescription);
  static const TextStyle mainTitle =
      TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black);
}
