import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View%20Model/SingInCubit/singin_cubit.dart';
import 'package:news_app/Features/Sign%20in/Presentation/View/Widgets/SingInViewbody.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SinginCubit>(
      create: (context) => SinginCubit(),
      child: SingInViewbody(
        login: true,
      ),
    );
  }
}
