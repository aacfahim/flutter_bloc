import 'package:flutter/material.dart';
import 'package:techsell_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:techsell_bloc/features/home/bloc/home_bloc.dart';
import 'package:techsell_bloc/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  CartTileWidget(
      {super.key, required this.productDataModel, required this.cartloc});
  ProductDataModel productDataModel;
  final CartBloc cartloc;

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
            ],
          ),
        ]),
      ),
    );
  }
}
