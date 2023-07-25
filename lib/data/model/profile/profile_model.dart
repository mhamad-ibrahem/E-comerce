import 'dart:io';

class ProfileModel {
  final String name;
  final String email;
  final String password;
  final String location;
  final String number;
  final String? image;

  ProfileModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.location,
      required this.number,
      required this.image});
  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) => ProfileModel(
        name: jsonData['user_name'],
        email: jsonData['user_email'],
        image: jsonData['user_image'],
        location: jsonData['user_location'],
        number: jsonData['user_number'],
        password: jsonData['user_password'],
      );
}

class ProfileModelRequest {
  final String name;
  final String email;
  final String password;
  final String location;
  final String number;
  final bool isImage;
  final String oldImageName;
  final File? image;

  ProfileModelRequest(this.isImage, this.oldImageName,
      {required this.name,
      required this.email,
      required this.password,
      required this.location,
      required this.number,
      required this.image});
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        if (isImage) 'image': image,
        'address': location,
        'phone': number,
        'password': password,
        'imageoldname': oldImageName,
      };
}
