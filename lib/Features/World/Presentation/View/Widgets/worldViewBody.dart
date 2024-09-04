import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Add_To_Favorite/add_to_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/GetFavorite/get_favorite_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View%20Model/Translation/translation_cubit.dart';
import 'package:news_app/Features/Home/Presentation/View/Widgets/CustomeContent.dart';
import 'package:news_app/Features/Saved/Presentation/View/SavedView.dart';

class Worldviewbody extends StatelessWidget {
  const Worldviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: FutureBuilder<List<News>>(
        future: AppServices().getNews(
            'world', '${DateTime.now().year}', '${DateTime.now().month}'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<News> Data = snapshot.data!;

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 5),
              children: [
                SizedBox(
                  height: 315,
                  child: BlocProvider<TranslationCubit>(
                    create: (context) => TranslationCubit(),
                    child: Customecontent(Data: Data, index: 0, h: 315),
                  ),
                ),
                SizedBox(
                  height: helper.getscreenHeight(context) - 315,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider<GetFavoriteCubit>(
                        create: (context) => GetFavoriteCubit(),
                      ),
                      BlocProvider<AddToFavoriteCubit>(
                        create: (context) => AddToFavoriteCubit(),
                      ),
                      BlocProvider<GetFavoriteCubit>(
                        create: (context) => GetFavoriteCubit(),
                      ),
                    ],
                    child: Savedview(
                      saved: false,
                      Data: Data,
                    ),
                  ),
                )
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
