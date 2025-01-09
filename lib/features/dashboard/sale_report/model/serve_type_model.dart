class ServeTypeModel {
  int? success;
  String? message;
  ServeTypeData? data;

  ServeTypeModel({this.success, this.message, this.data});

  ServeTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ServeTypeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ServeTypeData {
  String? takeaway;
  String? homedelivery;
  String? pathao;
  String? foodpanda;
  String? hungrynaki;
  String? foodie;
  String? pandago;
  String? guestComplimentory;
  String? staffComplimentory;
  String? cafe;
  String? express;

  ServeTypeData(
      {this.takeaway,
        this.homedelivery,
        this.pathao,
        this.foodpanda,
        this.hungrynaki,
        this.foodie,
        this.pandago,
        this.guestComplimentory,
        this.staffComplimentory,
        this.cafe,
        this.express});

  ServeTypeData.fromJson(Map<String, dynamic> json) {
    takeaway = json['takeaway'];
    homedelivery = json['homedelivery'];
    pathao = json['pathao'];
    foodpanda = json['foodpanda'];
    hungrynaki = json['hungrynaki'];
    foodie = json['foodie'];
    pandago = json['pandago'];
    guestComplimentory = json['guest-complimentory'];
    staffComplimentory = json['staff-complimentory'];
    cafe = json['cafe'];
    express = json['express'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['takeaway'] = takeaway;
    data['homedelivery'] = homedelivery;
    data['pathao'] = pathao;
    data['foodpanda'] = foodpanda;
    data['hungrynaki'] = hungrynaki;
    data['foodie'] = foodie;
    data['pandago'] = pandago;
    data['guest-complimentory'] = guestComplimentory;
    data['staff-complimentory'] = staffComplimentory;
    data['cafe'] = cafe;
    data['express'] = express;
    return data;
  }
}
