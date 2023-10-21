import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//   String? message;
//   String? code;
//   String? status;
//   int? userId;
//   int? empId;
//   String? empCode;
//   String? empName;
//   String? empJob;
//   String? empPhoto;
//
//   LoginModel({
//     this.message,
//     this.code,
//     this.status,
//     this.userId,
//     this.empId,
//     this.empCode,
//     this.empName,
//     this.empJob,
//     this.empPhoto,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//     message: json["Message"],
//     code: json["Code"],
//     status: json["Status"],
//     userId: json["UserId"],
//     empId: json["EmpId"],
//     empCode: json["EmpCode"],
//     empName: json["EmpName"],
//     empJob: json["EmpJob"],
//     empPhoto: json["EmpPhoto"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Message": message,
//     "Code": code,
//     "Status": status,
//     "UserId": userId,
//     "EmpId": empId,
//     "EmpCode": empCode,
//     "EmpName": empName,
//     "EmpJob": empJob,
//     "EmpPhoto": empPhoto,
//   };
// }

// class LoginModel {
//   int? id;
//   String? username;
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? gender;
//   String? image;
//   String? token;
//
//   LoginModel({
//      this.id,
//      this.username,
//      this.email,
//      this.firstName,
//      this.lastName,
//      this.gender,
//      this.image,
//      this.token,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//     id: json["id"],
//     username: json["username"],
//     email: json["email"],
//     firstName: json["firstName"],
//     lastName: json["lastName"],
//     gender: json["gender"],
//     image: json["image"],
//     token: json["token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "username": username,
//     "email": email,
//     "firstName": firstName,
//     "lastName": lastName,
//     "gender": gender,
//     "image": image,
//     "token": token,
//   };
// }

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

class LoginModel {
  bool success;
  Data user;
  Authorisation authorisation;

  LoginModel({
    required this.success,
    required this.user,
    required this.authorisation,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    user: Data.fromJson(json["data"]),
    authorisation: Authorisation.fromJson(json["authorisation"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": user.toJson(),
    "authorisation": authorisation.toJson(),
  };
}

class Authorisation {
  String token;

  Authorisation({
    required this.token,
  });

  factory Authorisation.fromJson(Map<String, dynamic> json) => Authorisation(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}

class Data {
  String name;
  String email;
  String countryCode;
  String phone;
  String phoneNumber;
  String gender;
  DateTime dob;
  int divisionId;
  String divisionName;
  int districtId;
  String districtName;
  String address;
  String status;
  String profilePhoto;

  Data({
    required this.name,
    required this.email,
    required this.countryCode,
    required this.phone,
    required this.phoneNumber,
    required this.gender,
    required this.dob,
    required this.divisionId,
    required this.divisionName,
    required this.districtId,
    required this.districtName,
    required this.address,
    required this.status,
    required this.profilePhoto,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    countryCode: json["country_code"],
    phone: json["phone"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
    dob: DateTime.parse(json["dob"]),
    divisionId: json["division_id"],
    divisionName: json["division_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    address: json["address"],
    status: json["status"],
    profilePhoto: json["profile_photo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "country_code": countryCode,
    "phone": phone,
    "phone_number": phoneNumber,
    "gender": gender,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "division_id": divisionId,
    "division_name": divisionName,
    "district_id": districtId,
    "district_name": districtName,
    "address": address,
    "status": status,
    "profile_photo": profilePhoto,
  };
}


