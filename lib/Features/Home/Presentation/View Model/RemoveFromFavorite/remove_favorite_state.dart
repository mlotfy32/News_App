part of 'remove_favorite_cubit.dart';

@immutable
abstract class RemoveFavoriteState {}

class RemoveFavoriteInitial extends RemoveFavoriteState {}

class RemoveFromFavoritSuccess extends RemoveFavoriteState {
  final bool isempty;
  var Data;
  RemoveFromFavoritSuccess(this.isempty, {required this.Data});
}

class RemoveFromFavoriteFailure extends RemoveFavoriteState {}
