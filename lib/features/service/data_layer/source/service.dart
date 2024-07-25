import 'package:test/core/api/apis.dart';
import 'package:test/core/network/http.dart';
import 'package:test/features/service/data_layer/models/service.dart';
import 'package:test/features/service/data_layer/models/service_details.dart';

class ServiceSource {
  Future<List<ServiceModel>> getServices(int page, {String? value}) async {
    Request request = Request(EndPoint.getService, RequestMethod.get,
        authorized: true, queryParams: {"page": page, if (value != null) "name": value});

    Map<String, dynamic> response = await request.sendRequest();
    return ServiceModel.fromJsonList(response);
  }

  Future<ServiceProvidersModel> showService(int id) async {
    Request request = Request(
      EndPoint.showService(id),
      RequestMethod.get,
      authorized: true,
    );
    Map<String , dynamic> response = await request.sendRequest();
    return ServiceProvidersModel.fromJson(response["service_providers"]);
  }
}
