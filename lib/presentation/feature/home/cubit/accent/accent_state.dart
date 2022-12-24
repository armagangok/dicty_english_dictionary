// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'accent_cubit.dart';

abstract class AccentState {
  int accentIndex;

  AccentState({required this.accentIndex});
}

class AccentInitial extends AccentState {
  AccentInitial({required int accentIndex}) : super(accentIndex: accentIndex);
}

class AccentFetchingError extends AccentState {
  AccentFetchingError({required int accentIndex})
      : super(accentIndex: accentIndex);
  static const errorMessage = "Error while fetching accent.";
}
