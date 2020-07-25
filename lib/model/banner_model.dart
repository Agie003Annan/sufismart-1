class BannerModel{
  String imagepath;

  BannerModel(this.imagepath);
  

  BannerModel.fromJson(Map<String,dynamic>json){
    imagepath = json['imagepath'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagepath'] = this.imagepath;
    return data;
   }
}