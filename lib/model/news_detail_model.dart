class DataDetailNews{  
  String detailNewsTitle;
  String detailNewsDesc;
  String detailNewsDate;
  String detailNewsImage;  

  DataDetailNews({this.detailNewsTitle,this.detailNewsDesc,this.detailNewsDate,this.detailNewsImage});

  DataDetailNews.fromJson(Map<String,dynamic> json){    
    detailNewsTitle = json["news_title"];
    detailNewsDesc = json["news_description"];
    detailNewsDate = json["news_date"];
    detailNewsImage = json["news_image"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();    
    data["news_title"] = this.detailNewsTitle;
    data["news_description"] = this.detailNewsDesc;
    data["news_date"] = this.detailNewsDate;
    data["news_image"] = this.detailNewsImage;
    return data;
  }

}