part of 'get_favorite_cubit.dart';

@immutable
abstract class GetFavoriteState {}

class GetFavoriteInitial extends GetFavoriteState {}

class GetFavoriteLoading extends GetFavoriteState {}

class GetdataSuccess extends GetFavoriteState {
  final List<SaveModel> Data;

  GetdataSuccess({required this.Data});
}

class GetdataFailure extends GetFavoriteState {}
