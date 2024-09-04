part of 'get_search_cubit.dart';

@immutable
abstract class GetSearchState {}

class GetSearchInitial extends GetSearchState {}

class GetSearchLoading extends GetSearchState {}

class GetSearchSuccess extends GetSearchState {
  final List<News> Data;

  GetSearchSuccess({required this.Data});
}

class GetSearchFailed extends GetSearchState {}
