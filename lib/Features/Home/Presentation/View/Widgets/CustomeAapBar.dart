import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';

class CustomeApbar extends StatelessWidget {
  const CustomeApbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Appassets.searchIcon,
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            )),
        FlutterLogo(
          size: 40,
        ),
        CircleAvatar(
          radius: 25,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
