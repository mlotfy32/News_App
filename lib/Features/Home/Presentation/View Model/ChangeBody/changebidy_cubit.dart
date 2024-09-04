import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changebidy_state.dart';

class ChangebidyCubit extends Cubit<ChangebidyState> {
  ChangebidyCubit() : super(ChangebidyInitial());
  change({required int index}) {
    if (index == 0) {
      emit(Changebody('all', Index: index));
    } else if (index == 1) {
      emit(Changebody('trending', Index: index));
    } else if (index == 2) {
      emit(Changebody('popular', Index: index));
    } else {
      emit(Changebody('now', Index: index));
    }
  }
}
