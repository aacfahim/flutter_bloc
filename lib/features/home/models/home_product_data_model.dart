class ProductDataModel {
  String? name;
  String? description;
  int? price;
  String? category;

  ProductDataModel({this.name, this.description, this.price, this.category});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category'] = this.category;
    return data;
  }
}
