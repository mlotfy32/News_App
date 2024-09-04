import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Search/Presentation/View/Widgets/searchViewBody.dart';
import 'package:news_app/Features/Search/Presentation/ViewModel/GetSearch/get_search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetSearchCubit>(
      create: (context) => GetSearchCubit(),
      child: Searchviewbody(),
    );
  }
}
