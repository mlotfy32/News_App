import 'package:flutter/material.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/customeForm.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/signInButtons.dart';

class SingInViewbody extends StatefulWidget {
  const SingInViewbody({super.key});

  @override
  State<SingInViewbody> createState() => _SingInViewbodyState();
}

class _SingInViewbodyState extends State<SingInViewbody> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Appassets.SigninPic,
                width: helper().getscreenWidth(context),
                height: helper().getHeight(0.3, context),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: helper().getHeight(0.2, context),
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.clip,
              Appstrings.signInTitle,
              style: AppfontStyle.introTitleStyle
                  .copyWith(color: Color(0xffd1d1d1), fontSize: 27),
            ),
            Signinbuttons(
              topDECO: true,
              text: Appstrings.register,
              onTap: () {},
            ),
            Signinbuttons(
              topDECO: false,
              text: Appstrings.signIn,
              onTap: () {},
            )
          ],
        ));
  }
}
