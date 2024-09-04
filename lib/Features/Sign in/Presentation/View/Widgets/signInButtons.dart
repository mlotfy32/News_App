import 'package:flutter/material.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';

class Signinbuttons extends StatelessWidget {
  Signinbuttons({super.key, required this.text, required this.onTap});
  final String text;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          child: Center(
            child: Text(
              text,
              style: AppfontStyle.introTitleStyle.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          width: 170,
          height: 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffB91638), Color(0xff291530)]),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
