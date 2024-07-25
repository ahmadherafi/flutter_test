class ServiceModel {
  int id;
  String name;
  String image;
  int rate;
  String title;

  ServiceModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.title,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        rate: json["rate"],
        title: json["service_title"],
      );

  static List<ServiceModel> fromJsonList(Map<String, dynamic> json) {
    List<ServiceModel> services = [];

    json["service_providers"].forEach(
      (element) => services.add(
        ServiceModel.fromJson(element),
      ),
    );
    return services;
  }
}
