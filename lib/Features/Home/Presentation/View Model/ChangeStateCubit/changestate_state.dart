part of 'changestate_cubit.dart';

@immutable
abstract class ChangestateState {}

class ChangestateInitial extends ChangestateState {}

class Changestate extends ChangestateState {
  final int Index;

  Changestate({required this.Index});
}
