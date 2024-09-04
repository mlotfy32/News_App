import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View%20Model/SingInCubit/singin_cubit.dart';

class Passform extends StatelessWidget {
  Passform({
    super.key,
    required this.controller,
    required this.title,
  });
  final TextEditingController controller;
  bool isVisable = true;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: BlocConsumer<SinginCubit, SinginState>(
        listener: (context, state) {
          if (state is ChangeVisability) {
            isVisable = state.visability;
          }
        },
        builder: (context, state) {
          return TextFormField(
            obscureText: isVisable,
            keyboardType: TextInputType.emailAddress,
            controller: controller,
            validator: (value) {
              if (value == '')
                return Appstrings.validateemail;
              else if (value!.length < 8) return Appstrings.validatepass;
            },
            style: AppfontStyle.introTitleStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    BlocProvider.of<SinginCubit>(context)
                        .visability(isVisible: isVisable);
                  },
                  icon: isVisable == true
                      ? Icon(
                          size: 22,
                          FontAwesomeIcons.eye,
                          color: Colors.black,
                        )
                      : Icon(
                          size: 22,
                          FontAwesomeIcons.eyeSlash,
                          color: Colors.black,
                        )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              label: Text(
                Appstrings.password,
                style:
                    AppfontStyle.introTitleStyle.copyWith(color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
