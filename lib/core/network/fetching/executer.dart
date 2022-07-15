import 'base_network_model.dart';
import 'convertor.dart';
import 'option_generator.dart';
import 'requestor.dart';

class NetworkExecuter {
  Future<K?> execute<T extends BaseNetworkModel, K>(
      {required T responseType,
      required NetworkOptionsGenerator options}) async {
    NetworkRequestor requestor = NetworkRequestor(networkOptions: options);
    var response = await requestor.sendRequest();
    if (response == null) return null;
    NetworkConverter converter = NetworkConverter(response: response);
    var convertedResponse = converter.convertResponse<T, K>(responseType);
    return convertedResponse;
  }
}
