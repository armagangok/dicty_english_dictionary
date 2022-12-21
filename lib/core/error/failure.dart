abstract class Failure {}

class NetworkFetchFailure extends Failure {}

class NetWork404Failure extends Failure {
  NetWork404Failure({
    required this.errorMessage,
    required this.errorTitle,
  });

  final String errorTitle;
  final String errorMessage;
}

class NetWorkUnknownFailure extends Failure {}