abstract class Failure {}

class NetworkFetchFailure extends Failure {}

class NetWork404Failure extends Failure {
  NetWork404Failure({required this.errorMessage});

  final String errorMessage;
}

class NetWorkUnknownFailure extends Failure {}
