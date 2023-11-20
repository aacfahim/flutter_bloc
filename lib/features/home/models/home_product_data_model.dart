class ProductDataModel {
  int? id;
  String? name;
  String? description;
  int? price;
  String? category;

  ProductDataModel(
      {this.id, this.name, this.description, this.price, this.category});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category'] = this.category;
    return data;
  }
}
