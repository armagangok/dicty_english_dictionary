part of 'search_cubit.dart';

abstract class SearchState {}

abstract class SearchFailedState extends SearchState {
  static String errorTitle = "Warning";
  static String errorMessage = "An unknown error occurred while searching.";
}

class SearchInitial extends SearchState {}

class SearchingState extends SearchState {}

class SearchSavingFailure extends SearchState {}

class SearchFailed extends SearchFailedState {
  SearchFailed({
    required this.errorMessage,
    required this.errorTitle,
  });
  final String errorTitle;
  final String errorMessage;
}

class SearchSucceded extends SearchState {
  SearchSucceded({required this.response});

  final WordResponse response;
}
