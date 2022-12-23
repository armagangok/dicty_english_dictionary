// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'accent_cubit.dart';

abstract class AccentState {
  int accent;

  AccentState({required this.accent});
}

class AccentInitial extends AccentState {
  AccentInitial({required int accent}) : super(accent: accent);
}

class AccentFetchingError implements AccentState {
  AccentFetchingError({required this.accent});

  @override
  int accent = 0;

  static const errorMessage = "Error while fetching accent.";
}

class AccentFetched extends AccentState {
  AccentFetched({required int accent}) : super(accent: accent);
}
