part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}
class ItemAddedToCart extends StoreState {}
class ItemAddedToPurchase extends StoreState {}
class DeleteFromCartSuccess extends StoreState {}
class DeleteFromCartFailure extends StoreState {}
