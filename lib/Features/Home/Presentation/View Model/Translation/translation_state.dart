part of 'translation_cubit.dart';

@immutable
abstract class TranslationState {}

class TranslationInitial extends TranslationState {}

class Translation extends TranslationState {
  final String text;
  final int index;
  final bool translat;
  Translation(this.index, this.translat, {required this.text});
}
