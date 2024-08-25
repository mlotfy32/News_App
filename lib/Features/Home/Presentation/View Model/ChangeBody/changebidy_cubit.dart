import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changebidy_state.dart';

class ChangebidyCubit extends Cubit<ChangebidyState> {
  ChangebidyCubit() : super(ChangebidyInitial());
  change({required int index}) {
    emit(Changebody(Index: index));
  }
}
