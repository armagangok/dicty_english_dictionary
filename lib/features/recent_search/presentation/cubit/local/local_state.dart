part of 'local_cubit.dart';

abstract class LocalState {}

abstract class LocalFailedState extends LocalState {
  static String errorTitle = "Warning!";
  static String errorMessage =
      "An unknown error occurred while fetching data from local database.";
}

class LocalInitial extends LocalState {}

class LocalingState extends LocalState {}

class LocalFailed extends LocalFailedState {
  LocalFailed({
    required this.errorMessage,
    required this.errorTitle,
  });
  final String errorTitle;
  final String errorMessage;
}

class LocalSucceded extends LocalState {
  LocalSucceded({required this.wordModel});

  final Meaning wordModel;
}
