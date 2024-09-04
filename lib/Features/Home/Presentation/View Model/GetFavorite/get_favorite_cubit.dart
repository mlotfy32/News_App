import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Core/Utiles/constans.dart';
import 'package:news_app/Features/Home/Data/saveModel.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit() : super(GetFavoriteInitial());
  getFavorite() async {
    Box<SaveModel> myFavoriteBox;

    emit(GetFavoriteLoading());
    try {
      myFavoriteBox = Hive.box<SaveModel>(Constans.KHiveFavorite);
      List<SaveModel> Data = await myFavoriteBox.values.toList();
      emit(GetdataSuccess(Data: Data));
      return Data;
    } catch (e) {
      emit(GetdataFailure());
    }
  }
}
