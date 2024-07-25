import 'package:test/core/api/apis.dart';
import 'package:test/core/network/http.dart';
import 'package:test/features/service/data_layer/models/service.dart';

class ServiceSource {
  Future<List<ServiceModel>> getServices(int page , {String? value}) async {
    Request request = Request(
      EndPoint.getService,
      RequestMethod.get,
      authorized: true,
      queryParams: {
        "page":page,
        if(value!=null)"name":value
      }
    );

    Map<String , dynamic> response = await request.sendRequest();
    return ServiceModel.fromJsonList(response);
  }
}
