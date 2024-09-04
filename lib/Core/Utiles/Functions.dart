import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppFontsStyle.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:translator/translator.dart';

class helper {
  static double getscreenHeight(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return height;
  }

  static double getscreenWidth(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width;
  }

  static double getHeight(double Heigth, BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * Heigth;
    return height;
  }

  static double getwidth(double Width, BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * Width;
    return width;
  }

  static Translate({required String text}) async {
    var translator = await GoogleTranslator();
    var translation = await translator.translate(text, to: 'ar');

    return await translation.text;
  }

  static void loading() {
    Get.defaultDialog(
        radius: 10,
        titlePadding: EdgeInsets.all(20),
        backgroundColor: Colors.blueGrey[900],
        title: Appstrings.loading,
        titleStyle: AppfontStyle.introTitleStyle
            .copyWith(color: Colors.white, fontSize: 20),
        content: Material(
          color: Colors.transparent,
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Color(0xffB91638),
              size: 70,
            ),
          ),
        ));
  }

  static void success(String title) {
    Get.defaultDialog(
        radius: 10,
        titlePadding: EdgeInsets.all(20),
        backgroundColor: Colors.blueGrey[900],
        title: title,
        titleStyle: AppfontStyle.introTitleStyle.copyWith(color: Colors.white),
        content: Material(
          color: Colors.transparent,
          child: Center(
              child: Lottie.asset(Appassets.success, width: 120, height: 120)),
        ));
  }

  static void fail(String title) {
    Get.defaultDialog(
        radius: 10,
        titlePadding: EdgeInsets.all(20),
        backgroundColor: Colors.blueGrey[900],
        title: title,
        titleStyle: AppfontStyle.introTitleStyle.copyWith(color: Colors.white),
        content: Material(
          color: Colors.transparent,
          child: Center(
              child: Lottie.asset(Appassets.faile, width: 150, height: 150)),
        ));
  }

  // static void snackloading(String title) {
  //   Get.snackbar(
  //     '',
  //     snackPosition: SnackPosition.BOTTOM,
  //     '',
  //     titleText: Row(
  //       children: [
  //         SvgPicture.asset(
  //           Appassets.logo,
  //           width: 45,
  //           height: 40,
  //           fit: BoxFit.fill,
  //         ),
  //         Text(
  //           AppStrings.socialApp,
  //           style: Fontstylesmanager.welcomeTitleStyle.copyWith(fontSize: 20),
  //         ),
  //       ],
  //     ),
  //     messageText: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           title,
  //           style:
  //               Fontstylesmanager.welcomeSubTitleStyle.copyWith(fontSize: 17),
  //         ),
  //         CircularProgressIndicator()
  //       ],
  //     ),
  //   );
  // }

  // static void snackfailure(String title) {
  //   Get.snackbar(
  //     '',
  //     snackPosition: SnackPosition.BOTTOM,
  //     '',
  //     titleText: SizedBox(
  //       height: 30,
  //       child: Row(
  //         children: [
  //           SvgPicture.asset(
  //             Appassets.logo,
  //             width: 45,
  //             height: 40,
  //             fit: BoxFit.fill,
  //           ),
  //           Text(
  //             AppStrings.socialApp,
  //             style: Fontstylesmanager.welcomeTitleStyle.copyWith(fontSize: 20),
  //           ),
  //         ],
  //       ),
  //     ),
  //     messageText: SizedBox(
  //       height: 22,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             title,
  //             style: Fontstylesmanager.welcomeTitleStyle.copyWith(fontSize: 17),
  //           ),
  //           Lottie.asset(
  //             Appassets.fail,
  //             width: 50,
  //             height: 50,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // static Future<void> getLikes(
  //     {required oldsnapshot,
  //     required int Index,
  //     required List likes,
  //     required BuildContext context}) async {
  //   Get.dialog(Material(
  //     color: Colors.transparent,
  //     child: Container(
  //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             color: Colors.blueGrey.withOpacity(0.5)),
  //         margin: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
  //         // height: helper.getHeight(0.7, context),
  //         width: helper.getscreenWidth(context),
  //         child: ListView.separated(
  //             itemBuilder: (context, index) {
  //               var key = likes[index].keys;
  //               key = key.toString().split('(');
  //               key = key[1].toString().split(')');
  //               log('${key[0]}');

  //               return Row(
  //                 children: [
  //                   CircleAvatar(
  //                     radius: 30,
  //                     backgroundImage:
  //                         NetworkImage('${likes[index]['${key[0]}'][1]}'),
  //                   ),
  //                   SizedBox(
  //                     width: 10,
  //                   ),
  //                   Text(
  //                     '${likes[index]['${key[0]}'][0]}',
  //                     style: Fontstylesmanager.welcomeTitleStyle
  //                         .copyWith(fontSize: 20),
  //                   ),
  //                   Spacer(),
  //                   Icon(
  //                     FontAwesomeIcons.solidHeart,
  //                     color: Colors.red,
  //                   ),
  //                 ],
  //               );
  //             },
  //             separatorBuilder: (context, index) => Divider(),
  //             itemCount: likes.length)),
  //   ));
  // }

  static checkInternetConnection({required BuildContext context}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    var x = await InternetConnectionChecker().connectionStatus.asStream();
    log('=====$x');
    if (result == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            Appstrings.noInternet,
            style: AppfontStyle.introTitleStyle
                .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          SvgPicture.asset(
            Appassets.wifi,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ],
      )));
    }
  }

//   static editrepostProfile_Back({required String title, required String id}) {
//     Constants().usersPosts.doc(id).update({'title': title});
//     Get.back();
//   }

//   static repostProfile_Back(
//       {required String title,
//       required String oldState,
//       required String oldName1,
//       required String oldName2,
//       required String oldProfile,
//       required String state,
//       required String oldTime,
//       required String oldId,
//       required int share,
//       required String imageUrl}) async {
//     helper.loading();
//     var profilePi = await profilePic!.get('profilePic');
//     var name1 = await fristname!.get('fristName');
//     var name2 = await lastname!.get('lastName');
//     var userId = await Constants().userId;

//     Constants().usersPosts.add({
//       'title': title,
//       'fristName': name1,
//       'lastName': name2,
//       'userId': userId,
//       'oldState': state == 'profile'
//           ? 'update his profile picture'
//           : 'update his cover picture',
//       'aboutPost': state == 'profile'
//           ? 'update his profile picture'
//           : 'update his cover picture',
//       'postState': 'repost this image',
//       'imageUrl': imageUrl,
//       'oldName1': oldName1,
//       'oldName2': oldName2,
//       'profilePic': '$oldProfile',
//       'oldId': oldId,
//       'backPic': '$backPic',
//       'oldprofilePic': profilePi,
//       'oldTime': oldTime,
//       'time': '${DateTime.now()}',
//       'share': 0,
//       'likes': [],
//       'comments': []
//     });
//     Constants().usersPosts.doc(oldId).update({'share': share + 1});
//     final player = AudioPlayer();
//     await player.play(AssetSource('done.wav'));
//     Get.back();
//     Get.back();
//   }

//   static smallSnac({required String title, required BuildContext context}) {
//     Get.dialog(Material(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.blueGrey[900]),
//         margin: EdgeInsets.only(
//             top: helper.getHeight(0.8, context),
//             bottom: helper.getHeight(0.1, context),
//             left: helper.getwidth(0.32, context),
//             right: helper.getwidth(0.32, context)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SvgPicture.asset(
//               Appassets.logo,
//               width: 45,
//               height: 40,
//               fit: BoxFit.fill,
//             ),
//             Text(
//               title,
//               style: Fontstylesmanager.welcomeTitleStyle
//                   .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//     ));
//     Timer(
//       Duration(seconds: 1),
//       () {
//         Get.back();
//       },
//     );
//   }
}
