class KotaDetailModel{
  String officeName;
  String address;
  String tagName;
  String lat;
  String lng;

  KotaDetailModel({this.officeName,this.address,this.tagName,this.lat,this.lng,});

  KotaDetailModel.fromJson(Map<String, dynamic> map){
    officeName = map["office_name"];
    address = map["addr"];
    tagName = map["tag_name"];
    lat = map["lat"];
    lng = map["lng"];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['office_name'] = this.officeName;
    data['addr'] = this.address;
    data['tag_name'] = this.tagName;
    data['lat'] = this.lat;
    data['lng'] = this.lng;    
  }

  

}