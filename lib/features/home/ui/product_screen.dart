import 'package:flutter/material.dart';
import 'package:techsell_bloc/features/home/models/home_product_data_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Price \$" + productDataModel.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          //homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          //homeBloc.add(HomeCartButtonNavigateEvent());
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
