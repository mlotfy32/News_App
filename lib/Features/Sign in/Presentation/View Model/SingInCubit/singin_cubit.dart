import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Presentation/View/HomeView.dart';

part 'singin_state.dart';

class SinginCubit extends Cubit<SinginState> {
  SinginCubit() : super(SinginInitial());
  SingIn(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    try {
      helper.loading();
      helper.checkInternetConnection(context: context);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      Get.back();
      Get.offAll(() => Homeview());
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'user-not-found') {
        helper.fail('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        helper.fail('Wrong password provided for that user.');
      } else {
        helper.fail('Wrong password provided for that user.');
      }
    }
  }

  SingUp(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      Get.back();
      Get.offAll(() => Homeview());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        helper.fail('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        helper.fail('The account already exists for that email.');
      }
    } catch (e) {
      helper.fail(Appstrings.something);
    }
  }

  visability({required bool isVisible}) {
    if (isVisible == true) {
      emit(ChangeVisability(visability: false));
    } else {
      emit(ChangeVisability(visability: true));
    }
  }
}
