// //part of 'favorite_cubit.dart';

// import 'package:shopping/model/product_model.dart';

// sealed class FavoriteState {}

// final class FavoriteInitial extends FavoriteState {}

// final class FavoriteLoading extends FavoriteState {}

// final class FavoriteLoaded extends FavoriteState {
//   final List<ProductModel> favoriteItems;

//   FavoriteLoaded(this.favoriteItems);
// }

// final class FavoriteError extends FavoriteState {
//   final String masg;

//   FavoriteError({required this.masg});
// }
import 'package:shopping/model/product_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
// class AddingToFavortie extends FavoriteState {}
// class AddedToFavortie extends FavoriteState {}
// class AddedToFavortieError extends FavoriteState {
//     final String message;

//   AddedToFavortieError( this.message);

// }

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductModel> favoriteItems;

  FavoriteLoaded(this.favoriteItems);
}

class FavoriteError extends FavoriteState {}
