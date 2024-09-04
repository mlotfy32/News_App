part of 'addpicture_cubit.dart';

@immutable
abstract class AddpictureState {}

class AddpictureInitial extends AddpictureState {}

class AddpictureLoading extends AddpictureState {}

class AddpictureSuccess extends AddpictureState {
  final String Url;

  AddpictureSuccess({required this.Url});
}

class AddpictureFailure extends AddpictureState {}
