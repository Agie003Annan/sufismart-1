class ModelPekerjaan{
  String pekerjaanName;

  ModelPekerjaan({this.pekerjaanName});

  ModelPekerjaan.fromJson(Map<String,dynamic> map){
      pekerjaanName = map["PEKERJAAN_TYPE"];      
  }
  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      'PEKERJAAN_TYPE': pekerjaanName
    };
    return map;
  }
}


