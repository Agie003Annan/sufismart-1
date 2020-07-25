class ProductModel{
  String categorycode;
  String categoryname;
  String categoryimage;

  ProductModel(this.categorycode,this.categoryname,this.categoryimage);

  ProductModel.fromjson(Map<String,dynamic> json){
    categorycode = json["category_code"];
    categoryname = json["category_name"];
    categoryimage = json["category_image"];    
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String,dynamic>();
    data['category_code'] = this.categorycode;
    data['category_name'] = this.categoryname;
    data['category_image'] = this.categoryimage;
    return data;
  }
}