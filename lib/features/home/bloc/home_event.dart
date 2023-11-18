part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeCartWishListButtonClickedEvent extends HomeEvent {}

class HomeCartWishListButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
