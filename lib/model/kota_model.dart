class KotaModel {
String kotaID;
String kotaNAME;

KotaModel(this.kotaID, this.kotaNAME);

  KotaModel.fromJson(Map<String, dynamic> map) {
    kotaID = map['kota_kode'];
    kotaNAME = map['kota_name'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'kota_kode': kotaID,
      'kota_name': kotaNAME
    };
    return map;
  }
}