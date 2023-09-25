import 'package:flutter/material.dart';
import 'package:techsell_bloc/features/home/bloc/home_bloc.dart';
import 'package:techsell_bloc/features/home/models/home_product_data_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
      {super.key, required this.productDataModel, required this.homeBloc});
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(productDataModel.name.toString()),
            subtitle: Column(
              children: [
                Text(productDataModel.description.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price \$" + productDataModel.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(
                              productDataModel));
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductCartButtonClickedEvent(
                              productDataModel));
                        },
                        icon: Icon(Icons.shopping_bag_outlined))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
