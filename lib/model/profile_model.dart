class DataProfile{
  String nama;
  String email;
  String tanggallahir;
  String nohandphone;
  String gender;
  String pekerjaan;
  String noktp;
  String nokontrak1;
  String nokontrak2;
  String nokontrak3;

  DataProfile({
    this.nama,
    this.email,
    this.tanggallahir,
    this.nohandphone,
    this.gender,
    this.pekerjaan,
    this.noktp,
    this.nokontrak1,
    this.nokontrak2,
    this.nokontrak3,
  });

  factory DataProfile.fromJson(Map<String,dynamic> json) => DataProfile(
    nama : json['nama'] ,
    email : json['email'] ,
    tanggallahir : json['tanggallahir'] ,
    nohandphone : json['nohandphone'] ,
    gender : json['gender'] ,
    pekerjaan : json['pekerjaan'] ,
    noktp : json['noktp'] ,
    nokontrak1 : json['nokontrak1'] ,
    nokontrak2 : json['nokontrak2'] , 
    nokontrak3 : json['nokontrak3'] , 
  );
  Map<String,dynamic> toJson() => {
    "nama" : nama,
    "email" : email,
    "tanggallahir" : tanggallahir,
    "nohandphone" : nohandphone,
    "gender" : gender,
    "pekerjaan" : pekerjaan,
    "noktp" : noktp,
    "nokontrak1" : nokontrak1,
    "nokontrak2" : nokontrak2,
    "nokontrak3" : nokontrak3,

  };
}