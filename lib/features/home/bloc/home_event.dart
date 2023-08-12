part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishListButtonClikedEvent extends HomeEvent {}

class HomeProductCartButtonEvent extends HomeEvent {}

class HomeProductWishListButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
