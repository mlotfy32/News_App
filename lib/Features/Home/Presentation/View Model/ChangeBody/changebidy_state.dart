part of 'changebidy_cubit.dart';

@immutable
abstract class ChangebidyState {}

class ChangebidyInitial extends ChangebidyState {}

class Changebody extends ChangebidyState {
  final int Index;

  Changebody({required this.Index});
}
