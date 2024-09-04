import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Utiles/Functions.dart';
import 'package:news_app/Core/Utiles/constans.dart';
import 'package:news_app/Features/Home/Data/saveModel.dart';

part 'remove_favorite_state.dart';

class RemoveFavoriteCubit extends Cubit<RemoveFavoriteState> {
  RemoveFavoriteCubit() : super(RemoveFavoriteInitial());
  removeFavorite(String Key) async {
    Box myBox;
    Box<SaveModel> myFavoriteBox;

    helper.loading();
    try {
      myBox = Hive.box(Constans.KBox);
      myFavoriteBox = Hive.box<SaveModel>(Constans.KHiveFavorite);
      myBox.delete(Key);
      List<SaveModel> Data = await myFavoriteBox.values.toList();
      emit(RemoveFromFavoritSuccess(Data.isEmpty ? true : false, Data: Data));
    } catch (e) {
      emit(RemoveFromFavoriteFailure());
    }
  }
}
