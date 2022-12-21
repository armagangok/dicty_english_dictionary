part of 'search_cubit.dart';

abstract class SearchState {}

abstract class SearchFailedState extends SearchState {
  static String errorMessage = "An unknown error occurred while searching.";
}

class SearchInitial extends SearchState {}

class SearchFailed extends SearchFailedState {
  SearchFailed({required this.errorMessage});

  final String errorMessage;
}

class SearchSucceded extends SearchState {
  SearchSucceded({required this.wordModel});

  final WordModel wordModel;
}
