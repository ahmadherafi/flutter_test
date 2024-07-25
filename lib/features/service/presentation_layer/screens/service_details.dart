import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/text.dart';



class CardDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> serviceProvider = {
    "id": 1,
    "name": "Orville Wyman",
    "email": "diego40@pfannerstill.org",
    "phone": "+1-281-893-1575",
    "description":
        "Prizes!' Alice had been to the executioner: 'fetch her here.' And the muscular strength, which it gave to my right size to do it! Oh dear! I'd nearly forgotten to ask.' 'It turned into a.",
    "image": "https://test.quantumgate.io/storage/1/1.png",
    "rate": 1,
    "service": {
      "id": 1,
      "title": "Alice noticed with some.",
      "description":
          "At last the Mock Turtle said: 'advance twice, set to work, and very angrily. 'A knot!' said Alice, in a solemn tone, only changing the order of the way to explain the paper. 'If there's no use in.",
      "created_at": "2024-07-22T09:05:11.000000Z",
      "updated_at": "2024-07-22T09:05:11.000000Z"
    }
  };
  CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(serviceProvider['image']),
              ),
            ),
            const SizedBox(height: 16),
            NormalTextWidget(
              serviceProvider['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Center(
              child: NormalTextWidget(
                serviceProvider['email'],
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            Center(
              child: NormalTextWidget(
                serviceProvider['phone'],
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
              serviceProvider['description'],
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
                      serviceProvider['service']['title'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    NormalTextWidget(
                      serviceProvider['service']['description'],
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 8),
                    NormalTextWidget(
                      'Created At: ${serviceProvider['service']['created_at']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    NormalTextWidget(
                      'Updated At: ${serviceProvider['service']['updated_at']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).makeSafeArea();
  }
}
