import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Utiles/Functions.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());
  translate(text, int index) async {
    try {
      String x = await helper.Translate(text: '$text');
      emit(Translation(
        index,
        true,
        text: '$x',
      ));
    } catch (e) {
      // helper
    }
  }
}
