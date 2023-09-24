import 'package:flutter/material.dart';
import 'package:techsell_bloc/features/home/models/home_product_data_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productDataModel.name.toString()),
      subtitle: Text(productDataModel.description.toString()),
      trailing: Text(productDataModel.category.toString()),
    );
  }
}
