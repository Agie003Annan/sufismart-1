class ImgNewsModel{
  String newsid;
  String imagepath;
  // String title;
  // String desc;
  // String newsdate;
  //ImgNewsModel(this.newsid,this.imagepath,this.title,this.desc,this.newsdate);
   ImgNewsModel(this.newsid,this.imagepath);
  

  ImgNewsModel.fromJson(Map<String,dynamic>json){
    newsid = json['m_news_id'];
    imagepath = json['imagepath'];
    // title = json['title'];
    // desc = json['desc'];
    // newsdate = json['create_desc'];

  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_news_id'] = this.newsid;
    data['imagepath'] = this.imagepath;
    // data['title'] = this.title;
    // data['desc'] = this.desc;
    // data['create_date'] = this.newsdate;
    return data;
   }
}