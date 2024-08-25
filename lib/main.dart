import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/Core/Utiles/simpleObserver.dart';
import 'package:news_app/Features/Home/Presentation/View/HomeView.dart';
import 'package:news_app/Features/Home/Presentation/View/Intro.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/homeViewBody.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/SingInViewbody.dart';
import 'package:news_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = Simpleobserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(fontFamily: 'NotoSerif'),
        debugShowCheckedModeBanner: false,
        home: Homeview()
        // Intro(),
        );
  }
}
