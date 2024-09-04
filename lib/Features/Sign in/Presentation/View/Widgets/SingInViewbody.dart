import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View%20Model/SingInCubit/singin_cubit.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/customeForm.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/emailForm.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/passForm.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/signInButtons.dart';

class SingInViewbody extends StatefulWidget {
  const SingInViewbody({super.key, required this.login});
  final bool login;
  @override
  State<SingInViewbody> createState() => _SingInViewbodyState();
}

class _SingInViewbodyState extends State<SingInViewbody> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffB91638), Color(0xff291530)])),
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.login == true
                                ? Appstrings.hello
                                : Appstrings.create,
                            style: AppfontStyle.mainTitle
                                .copyWith(color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(
                            width: widget.login == true ? 230 : 160,
                          ),
                          Icon(
                            FontAwesomeIcons.handsWash,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        widget.login == true
                            ? Appstrings.signIn
                            : Appstrings.Account,
                        style: AppfontStyle.mainTitle
                            .copyWith(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: SizedBox(
                    height: helper.getscreenHeight(context) - 200,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: Form(
                        key: key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Emailform(
                                email: true,
                                controller: email,
                                icon: IconButton(
                                    color: Colors.white,
                                    onPressed: null,
                                    icon: Icon(FontAwesomeIcons.envelope)),
                                title: Appstrings.email),
                            Passform(
                                controller: pass, title: Appstrings.password),
                            Signinbuttons(
                              text: widget.login == true
                                  ? Appstrings.lohin
                                  : Appstrings.signIn,
                              onTap: () {
                                if (key.currentState!.validate()) {
                                  if (widget.login == true) {
                                    BlocProvider.of<SinginCubit>(context)
                                        .SingIn(
                                            context: context,
                                            email: email.text,
                                            pass: pass.text);
                                  } else {
                                    BlocProvider.of<SinginCubit>(context)
                                        .SingUp(
                                            email: email.text,
                                            pass: pass.text,
                                            context: context);
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            widget.login == true
                                ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      Appstrings.account,
                                      style: AppfontStyle.introTitleStyle,
                                    ),
                                  )
                                : SizedBox(),
                            widget.login == true
                                ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.to(() => BlocProvider<SinginCubit>(
                                              create: (context) =>
                                                  SinginCubit(),
                                              child:
                                                  SingInViewbody(login: false),
                                            ));
                                      },
                                      child: Text(
                                        Appstrings.singUp,
                                        style: AppfontStyle.mainTitle,
                                      ),
                                    ))
                                : SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
