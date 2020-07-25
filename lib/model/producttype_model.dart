class ProductTypeModel{
  String productDetailCode;  
  String productDetailName;
  String productDetailPrice;
  String productDetailImage;
  String productName;
  String prodType;
  String productCategory;
  String productCategoryCode;

  ProductTypeModel(this.productDetailCode,this.productDetailName,this.productDetailPrice,this.productDetailImage,this.productName,this.prodType,this.productCategory,this.productCategoryCode);

  ProductTypeModel.fromJson(Map<String,dynamic> json){
    productDetailCode = json["product_d_code"];
    productDetailName = json["product_d_name"];
    productDetailPrice = json["product_d_price"];
    productDetailImage = json["product_image"];
    productName = json["product_name"];
    prodType = json["product_type"];
    productCategory = json["product_category"];
    productCategoryCode = json["product_category_code"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['product_d_code'] = this.productDetailCode;
    data['product_d_name'] = this.productDetailName;
    data['product_d_price'] = this.productDetailPrice;
    data['product_image'] = this.productDetailImage;
    data['product_name'] = this.productName;
    data['product_type'] = this.prodType;
    data['product_category'] = this.productCategory;
    data['product_category_code'] = this.productCategoryCode;
    return data;
  }
}