import 'dart:convert';

AplikasiModel emptyFromJson(String str) => AplikasiModel.fromJson(json.decode(str));

String emptyToJson(AplikasiModel data) => json.encode(data.toJson());

class AplikasiModel {
  AplikasiModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool isSuccess;
  String message;
  DataAplikasi data;

  factory AplikasiModel.fromJson(Map<String, dynamic> json) => AplikasiModel(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: DataAplikasi.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": data.toJson(),
  };
}

class DataAplikasi {
  DataAplikasi({
    this.versi,
    this.phone,
    this.email   
  });

  String versi;
  String phone;
  String email;  

  factory DataAplikasi.fromJson(Map<String, dynamic> json) => DataAplikasi(
    versi: json["versi"],
    phone: json["phone"],
    email: json["email"],    
  );

  Map<String, dynamic> toJson() => {
    "versi": versi,
    "phone": phone,
    "email": email,    
  };
}
