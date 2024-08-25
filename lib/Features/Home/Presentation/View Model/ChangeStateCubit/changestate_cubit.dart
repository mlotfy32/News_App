import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changestate_state.dart';

class ChangestateCubit extends Cubit<ChangestateState> {
  ChangestateCubit() : super(ChangestateInitial());
  change({required int Index}) {
    emit(Changestate(Index: Index));
  }
}
