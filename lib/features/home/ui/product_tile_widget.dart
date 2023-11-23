import 'package:flutter/material.dart';
import 'package:techsell_bloc/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  ProductTileWidget({super.key, required this.productDataModel});
  ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Container(
          //   height: 20,
          //   width: double.maxFinite,
          // ),
          Container(
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Text(
                productDataModel.category.toString(),
                style: TextStyle(fontSize: 12),
              )),
          Text(
            productDataModel.name.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productDataModel.price.toString() + " BDT"),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_outline), onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.shopping_bag_outlined),
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
