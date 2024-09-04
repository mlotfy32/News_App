import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Core/Utiles/simpleObserver.dart';
import 'package:news_app/Features/Home/Data/saveModel.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/ChangeBody/changebidy_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/addPic/addpicture_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/HomeView.dart';
import 'package:news_app/Features/Home/Presentation/View/Intro.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/homeViewBody.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Sign_in_View.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/SingInViewbody.dart';
import 'package:news_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? profilePic;
SharedPreferences? isLogged;
List logg = [];
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SaveModelAdapter());
  await Hive.openBox<SaveModel>('fetch_favorite_news');
  await Hive.openBox('favorite_news');

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  profilePic = await SharedPreferences.getInstance();
  isLogged = await SharedPreferences.getInstance();
  var islogged = await isLogged!.get('logged');
  if (islogged == null) {
  } else {
    logg.add(true);
  }
  Bloc.observer = Simpleobserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddpictureCubit>(
          create: (context) => AddpictureCubit(),
        ),
        BlocProvider<ChangebidyCubit>(
          create: (context) => ChangebidyCubit(),
        )
      ],
      child: GetMaterialApp(
          theme: ThemeData(fontFamily: 'NotoSerif'),
          debugShowCheckedModeBanner: false,
          home: logg.isEmpty
              ? Intro()
              : FirebaseAuth.instance.currentUser == null
                  ? SignInView()
                  : Homeview()),
    );
  }
}
