import 'package:flutter/material.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';

class Emailform extends StatelessWidget {
  Emailform(
      {super.key,
      required this.email,
      required this.controller,
      required this.icon,
      this.onFieldSubmitted,
      required this.title});
  void Function(String)? onFieldSubmitted;
  final bool email;
  final TextEditingController controller;
  final Widget icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        keyboardType:
            email == true ? TextInputType.emailAddress : TextInputType.text,
        controller: controller,
        validator: (value) {
          if (value == '') return Appstrings.validateemail;
          if (email == true) {
            if (value!.contains('@gmail.com') == false)
              return Appstrings.invaledEmail;
          }
        },
        style: AppfontStyle.introTitleStyle.copyWith(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: icon,
          suffixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          label: Text(
            title,
            style: AppfontStyle.introTitleStyle.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
