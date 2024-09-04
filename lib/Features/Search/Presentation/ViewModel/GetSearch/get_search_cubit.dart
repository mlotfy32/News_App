import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Utiles/Api.dart';
import 'package:news_app/Features/Home/Data/Model.dart';

part 'get_search_state.dart';

class GetSearchCubit extends Cubit<GetSearchState> {
  GetSearchCubit() : super(GetSearchInitial());
  search({required String q}) async {
    emit(GetSearchLoading());
    try {
      List<News> Data = await AppServices()
          .getNews(q, '${DateTime.now().year}', '${DateTime.now().month}');
      emit(GetSearchSuccess(Data: Data));
      return Data;
    } on Exception catch (e) {
      emit(GetSearchFailed());
      log('===${e}');
    }
  }
}
