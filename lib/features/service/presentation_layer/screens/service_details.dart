import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/loader.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/features/service/business_logic_layer/service_controller.dart';

class CardDetailsScreen extends StatelessWidget {
  ServiceController serviceController = Get.find<ServiceController>();

  CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return serviceController.serviceProviderState.loading
              ? LoaderWidget(
                  color: AppColors.primeColor,
                ).center()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(serviceController.serviceProviderState.result.image),
                      ),
                    ),
                    const SizedBox(height: 16),
                    NormalTextWidget(
                      serviceController.serviceProviderState.result.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: NormalTextWidget(
                        serviceController.serviceProviderState.result.email,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                    Center(
                      child: NormalTextWidget(
                        serviceController.serviceProviderState.result.phone,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const NormalTextWidget(
                      'Description',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    NormalTextWidget(
                      serviceController.serviceProviderState.result.description,
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 24),
                    const NormalTextWidget(
                      'Service Details',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalTextWidget(
                              serviceController.serviceProviderState.result.serviceDetailsModel.title,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            NormalTextWidget(
                              serviceController.serviceProviderState.result.serviceDetailsModel.description,
                              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                            ),
                            const SizedBox(height: 8),
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating: serviceController.serviceProviderState.result.rate.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: AppColors.primeColor,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                              ignoreGestures: true,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        }),
      ),
    ).makeSafeArea();
  }
}
