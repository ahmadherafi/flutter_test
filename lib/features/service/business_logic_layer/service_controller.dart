import 'package:get/get.dart';
import 'package:rx_future/rx_future.dart';
import 'package:test/core/utils/pagination_list.dart';
import 'package:test/features/service/data_layer/models/service.dart';
import 'package:test/features/service/data_layer/models/service_details.dart';
import 'package:test/features/service/data_layer/source/service.dart';

class ServiceController extends GetxController {
  ServiceSource serviceSource = ServiceSource();
  RxFuture<Pagination<ServiceModel>> servicesState = RxFuture(Pagination.zero());

  Future<void> getServices({String? name}) async {
    await servicesState.observe(
      (value) async {
        await value?.nextPage((currentPage) async {
          return await serviceSource.getServices(currentPage, value: name);
        });
        return value!;
      },
    );
  }

  RxFuture<ServiceProvidersModel> serviceProviderState = RxFuture(ServiceProvidersModel.zero());

  Future<void> showService(int id) async {
    await serviceProviderState.observe(
      (p0) async {
        return await serviceSource.showService(id);
      },
    );
  }
}
