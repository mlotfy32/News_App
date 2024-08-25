import 'package:flutter/material.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';

class Signinbuttons extends StatelessWidget {
  Signinbuttons(
      {super.key,
      required this.topDECO,
      required this.text,
      required this.onTap});
  final bool topDECO;
  final String text;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    BoxDecoration topDecoration = BoxDecoration(
        color: Color(0xff3d3d3d),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)));
    BoxDecoration bottomDecoration = BoxDecoration(
        color: Color(0xff3d3d3d),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)));
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: Text(
              text,
              style: AppfontStyle.introTitleStyle
                  .copyWith(color: Color(0xffd1d1d1), fontSize: 20),
            ),
          ),
          width: 170,
          height: 70,
          decoration: topDECO == true ? topDecoration : bottomDecoration),
    );
  }
}
