
class CategoryModel {
  final String? id;
  final String categoryName;
  final String categoryCode;

  CategoryModel({this.id,required this.categoryName,required this.categoryCode});

  factory CategoryModel.fromJSON(Map<String,dynamic> json){
    return CategoryModel(
        categoryName: json["categoryName"],
        categoryCode: json["categoryCode"],
        id: json["_id"]
    );
  }

  Map<String,dynamic> toJSON(){
    return {
      "categoryName":categoryName,
      "categoryCode" : categoryCode
    };
  }
}