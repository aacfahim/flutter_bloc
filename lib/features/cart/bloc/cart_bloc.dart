import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:techsell_bloc/data/cart_items.dart';
import 'package:techsell_bloc/features/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartEmptyEvent>(cartEmptyEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    print("cart initial event emmitted");
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {}

  FutureOr<void> cartEmptyState(
      CartEmptyState event, Emitter<CartState> emit) {}

  FutureOr<void> cartEmptyEvent(CartEmptyEvent event, Emitter<CartState> emit) {
    if (cartItems.length <= 0) emit(CartEmptyState());
  }
}
