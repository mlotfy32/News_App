part of 'changebidy_cubit.dart';

@immutable
abstract class ChangebidyState {}

class ChangebidyInitial extends ChangebidyState {}

class Changebody extends ChangebidyState {
  final int Index;
  final String dataType;
  Changebody(this.dataType, {required this.Index});
}
