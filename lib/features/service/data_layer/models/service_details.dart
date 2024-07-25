class ServiceProvidersModel {
  int id;
  String name;
  String email;
  String phone;
  String description;
  String image;
  int rate;
  ServiceDetailsModel serviceDetailsModel;
  ServiceProvidersModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.description,
    required this.image,
    required this.rate,
    required this.serviceDetailsModel,
  });

  factory ServiceProvidersModel.zero() => ServiceProvidersModel(
        id: 0,
        name: "",
        email: "",
        phone: "",
        description: "",
        image: "",
        rate: 0,
        serviceDetailsModel: ServiceDetailsModel.zero(),
      );

  factory ServiceProvidersModel.fromJson(Map<String, dynamic> json) {
    return ServiceProvidersModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      description: json['description'],
      image: json['image'],
      rate: json['rate'],
      serviceDetailsModel: ServiceDetailsModel.fromJson(json['service']),
    );
  }
}

class ServiceDetailsModel {
  int id;
  String title;
  String description;

  ServiceDetailsModel({required this.id, required this.title, required this.description});

  factory ServiceDetailsModel.zero() => ServiceDetailsModel(
        id: 0,
        title: "",
        description: "",
      );

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    return ServiceDetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
