part of 'singin_cubit.dart';

@immutable
abstract class SinginState {}

class SinginInitial extends SinginState {}

class ChangeVisability extends SinginState {
  final bool visability;

  ChangeVisability({required this.visability});
}
