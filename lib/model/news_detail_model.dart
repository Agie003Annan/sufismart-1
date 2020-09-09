class DetailNews {
  DetailNews({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool isSuccess;
  String message;
  DataDetailNews data;

  factory DetailNews.fromJson(Map<String, dynamic> json) => DetailNews(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: DataDetailNews.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": data.toJson(),
  };
}

class DataDetailNews{  
  DataDetailNews({this.detailNewsTitle,this.detailNewsDesc,this.detailNewsDate,this.detailNewsImage});

  String detailNewsTitle;
  String detailNewsDesc;
  String detailNewsDate;
  String detailNewsImage;  

  factory DataDetailNews.fromJson(Map<String,dynamic> json) => DataDetailNews(  
    detailNewsTitle : json["news_title"],
    detailNewsDesc : json["news_description"],
    detailNewsDate : json["news_date"],
    detailNewsImage : json["news_image"],
  );

  Map<String,dynamic> toJson() => {     
    "news_title" :detailNewsTitle,
    "news_description" : detailNewsDesc,
    "news_date" : detailNewsDate,
    "news_image" : detailNewsImage,    
  };

}