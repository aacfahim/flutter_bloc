part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishListButtonClikedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishListButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
