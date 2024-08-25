import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/ChangeStateCubit/changestate_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/homeViewBody.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangestateCubit>(
      create: (context) => ChangestateCubit(),
      child: Homeviewbody(),
    );
  }
}
