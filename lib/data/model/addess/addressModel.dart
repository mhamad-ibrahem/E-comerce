import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  AddressModel({
    required this.addressId,
    required this.addressUserId,
    required this.addressCity,
    required this.addressStreet,
    required this.addressLat,
    required this.addressLang,
    required this.addressName,
  });

  String addressId;
  String addressUserId;
  String addressCity;
  String addressStreet;
  String addressLat;
  String addressLang;
  String addressName;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressId: json["address_id"],
        addressUserId: json["address_userId"],
        addressCity: json["address_city"],
        addressStreet: json["address_street"],
        addressLat: json["address_lat"],
        addressLang: json["address_lang"],
        addressName: json["address_name"],
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "address_userId": addressUserId,
        "address_city": addressCity,
        "address_street": addressStreet,
        "address_lat": addressLat,
        "address_lang": addressLang,
        "address_name": addressName,
      };
}
