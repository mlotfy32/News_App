import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:news_app/Features/Home/Data/saveModel.dart';
import 'package:news_app/Features/Saved/Presentation/View/Widgets/savedViewBody.dart';

class Savedview extends StatelessWidget {
  const Savedview({super.key, required this.saved, required this.Data});
  final bool saved;
  final List<News> Data;
  @override
  Widget build(BuildContext context) {
    return Savedviewbody(
      saved: saved,
      Data: Data,
    );
  }
}
