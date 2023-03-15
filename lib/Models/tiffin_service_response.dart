// To parse this JSON data, do
//
//     final tiffinServiceResponse = tiffinServiceResponseFromJson(jsonString);

import 'dart:convert';

TiffinServiceResponse tiffinServiceResponseFromJson(String str) => TiffinServiceResponse.fromJson(json.decode(str));

String tiffinServiceResponseToJson(TiffinServiceResponse data) => json.encode(data.toJson());

class TiffinServiceResponse {
  TiffinServiceResponse({
    this.responseCode,
    this.msg,
    this.data,
  });

  String? responseCode;
  String? msg;
  List<Datum>? data;

  factory TiffinServiceResponse.fromJson(Map<String, dynamic> json) => TiffinServiceResponse(
    responseCode: json["response_code"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "msg": msg,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.uname,
    this.email,
    this.mobile,
    this.address,
    this.description,
    this.perDayCharge,
    this.monthlyCharge,
    this.yearlyCharge,
    this.profileImage,
  });

  String? uname;
  String? email;
  String? mobile;
  String? address;
  String? description;
  String? perDayCharge;
  String? monthlyCharge;
  String? yearlyCharge;
  String? profileImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uname: json["uname"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    description: json["description"],
    perDayCharge: json["per_day_charge"],
    monthlyCharge: json["monthly_charge"],
    yearlyCharge: json["yearly_charge"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "uname": uname,
    "email": email,
    "mobile": mobile,
    "address": address,
    "description": description,
    "per_day_charge": perDayCharge,
    "monthly_charge": monthlyCharge,
    "yearly_charge": yearlyCharge,
    "profile_image": profileImage,
  };
}
