// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'accent_cubit.dart';

abstract class AccentState {}

class AccentInitial extends AccentState {
}

class AccentFetchingError extends AccentState {
  static const errorMessage = "Error while fetching accent.";
}
