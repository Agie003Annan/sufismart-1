class ImgNewsModel{
  String newsid;
  String imagepath;

  ImgNewsModel(this.newsid,this.imagepath);
  

  ImgNewsModel.fromJson(Map<String,dynamic>json){
    newsid = json['m_news_id'];
    imagepath = json['imagepath'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_news_id'] = this.newsid;
    data['imagepath'] = this.imagepath;
    return data;
   }
}