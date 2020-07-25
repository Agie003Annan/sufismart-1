
class PromoModel{
  String newsid;
  String newstitle;
  String newsimage;
  String newsdescription;
  String newsdate;

  PromoModel(this.newsid,this.newstitle,this.newsimage,this.newsdescription,this.newsdate);

  PromoModel.fromJson(Map<String,dynamic>json){
      newsid = json["m_news_id"];
      newstitle = json["news_title"];
      newsimage = json["news_image"];
      newsdescription = json["news_description"];
      newsdate = json["news_date"];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String,dynamic>();
    data['m_news_id'] = this.newsid;
    data['news_title'] = this.newstitle;
    data['news_image'] = this.newsimage;
    data['news_description'] = this.newsdescription;
    data['news_date'] = this.newsdate;
    return data;
  }
  
}