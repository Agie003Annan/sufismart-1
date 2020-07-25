class ProductListModel{
  String productCode;
  String productName;
  String productCategory;
  String productImage; 
  String productPrice;  

  ProductListModel(this.productCode,this.productName,this.productCategory,this.productImage,this.productPrice);

  ProductListModel.fromJson(Map<String,dynamic> json){
    productCode = json["product_code"];
    productName = json["product_name"];
    productImage = json["product_image"];
    productCategory = json["product_category"];
    productPrice = json["product_price"];    
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_category'] = this.productCategory;
    data['product_price'] = this.productPrice;
    return data;
  }
}