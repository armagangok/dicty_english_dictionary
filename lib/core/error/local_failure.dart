import 'contract/failure.dart';

class LocalSavingFailure extends Failure {
  final String errorTitle;
  final String errorMessage;

  LocalSavingFailure ({
    required this.errorMessage,
    required this.errorTitle,
  });
}

class LocalFetchingFailure extends Failure {}
