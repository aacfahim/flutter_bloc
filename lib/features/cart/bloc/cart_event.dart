part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartEmptyEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {}
