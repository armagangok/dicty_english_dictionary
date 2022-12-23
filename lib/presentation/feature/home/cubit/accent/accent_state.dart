part of 'accent_cubit.dart';

abstract class AccentState {}

class AccentDataState extends AccentState {
  AccentDataState({required this.accent});
  int accent;
}

class AccentInitial extends AccentState {}

class AccentFetchingError implements AccentState {
  static const errorMessage = "Error while fetching accent.";
}

class AccentFetched extends AccentDataState {
  AccentFetched({required int accent}) : super(accent: accent);
}
