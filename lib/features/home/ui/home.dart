import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techsell_bloc/features/cart/ui/cart.dart';
import 'package:techsell_bloc/features/home/bloc/home_bloc.dart';
import 'package:techsell_bloc/features/home/ui/product_screen.dart';
import 'package:techsell_bloc/features/wishlist/ui/wish_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(),
              ));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WishList(),
              ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(title: Text("TechShell"), actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border_outlined)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined)),
              ]),
              body: ListView.builder(
                itemCount: successState.product.length,
                itemBuilder: (context, index) {
                  return ProductScreen(
                      productDataModel: successState.product[index]);
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(body: Center(child: Text("Error")));

          default:
            return Container();
        }
      },
    );
  }
}
