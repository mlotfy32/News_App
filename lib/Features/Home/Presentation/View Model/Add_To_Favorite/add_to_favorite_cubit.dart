import 'package:bloc/bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Utiles/AppAssets.dart';
import 'package:news_app/Core/Utiles/AppStrings.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Core/Utiles/constans.dart';
import 'package:news_app/Features/Home/Data/saveModel.dart';

part 'add_to_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  AddToFavoriteCubit() : super(AddToFavoriteInitial());
  addToFavorite(SaveModel favorite, String title) async {
    Box myBox;
    Box myFavoriteBox;
    helper.loading();
    try {
      myBox = Hive.box(Constans.KBox);
      myFavoriteBox = Hive.box<SaveModel>(Constans.KHiveFavorite);
      await myFavoriteBox.add(favorite);
      await myBox.put(title, title);
      Get.back();
      helper.success(Appstrings.added);
      emit(AddtofavoriteSuccess());
    } catch (e) {
      helper.fail(Appstrings.something);
      emit(AddtofavoriteFailure());
    }
  }
}
