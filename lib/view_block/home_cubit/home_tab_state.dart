
// import 'package:flutter/material.dart';
// import 'package:shopping/model/product_model.dart';

// abstract class HomeTabState  {
//   const HomeTabState();

//   @override
//   List<Object?> get props => [];
// }

// class HomeTabInitial extends HomeTabState {}

// class HomeTabLoading extends HomeTabState {}

// final class HomeTabLoaded extends HomeTabState {
//   final List<String> announcementsImages;
//   final List<ProductModel> products;

//   HomeTabLoaded({
//     required this.announcementsImages,
//     required this.products, required List<Image> annonsenousImage,
//   });

//   get annonsenousImage => null;
// }

// class SetFavoriteLoading extends HomeTabState {
//   final String productId;

//   const SetFavoriteLoading(this.productId);

//   @override
//   List<Object?> get props => [productId];
// }

// class SetFavoriteSuccess extends HomeTabState {
//   final String productId;
//   final bool isFavorite;

//   const SetFavoriteSuccess({
//     required this.productId,
//     required this.isFavorite,
//   });

//   @override
//   List<Object?> get props => [productId, isFavorite];
// }

// class SetFavoriteError extends HomeTabState {
//   final String message;

//   const SetFavoriteError(this.message);

//   @override
//   List<Object?> get props => [message];
// }
// final class HomeTabError extends HomeTabState {
//   final String message;

//   HomeTabError(    this.message,
// );
// }
// class AddingToFavortie extends HomeTabState {}
// class AddedToFavortie extends HomeTabState {}
// class AddedToFavortieError extends HomeTabState {
//     final String message;

//   AddedToFavortieError( this.message);

// }


// import 'package:flutter/material.dart';
// import 'package:shopping/model/product_model.dart';

// abstract class HomeTabState {}

// class HomeTabInitial extends HomeTabState {}

// class HomeTabLoading extends HomeTabState {}

// class HomeTabLoaded extends HomeTabState {
//   final List<Image> annonsenousImage;
//   final List<ProductModel> products;

//   HomeTabLoaded({
//     required this.annonsenousImage,
//     required this.products,
//   });
// }

// class SetFavoriteLoading extends HomeTabState {
//   final String productId;
//   SetFavoriteLoading(this.productId);
// }

// class SetFavoriteSuccess extends HomeTabState {
//   final String productId;
//   final bool isFavorite;
//   final bool isfavort; // تأكد من تبرير هذا الحقل
//   final String favoritedId;

//   SetFavoriteSuccess({
//     required this.productId,
//     required this.isFavorite,
//     required this.isfavort,
//     required this.favoritedId,
//   });
// }

// class SetFavoriteError extends HomeTabState {
//   final String message;
//   SetFavoriteError(this.message);
// }

// final class HomeTabError extends HomeTabState {
//   final String message;

//   HomeTabError({required this.message});
// }

// حالة إضافة/إزالة المفضلة
import 'package:flutter/material.dart';
import 'package:shopping/model/product_model.dart';

abstract class HomeTabState  {
  const HomeTabState();

  @override
  List<Object?> get props => [];
}

class HomeTabInitial extends HomeTabState {}

class HomeTabLoading extends HomeTabState {}

class HomeTabLoaded extends HomeTabState {
  final List<Image> annonsenousImage;
  final List<ProductModel> products;

  const HomeTabLoaded({
    required this.annonsenousImage,
    required this.products,
  });

  @override
  List<Object?> get props => [annonsenousImage, products];
}

class SetFavoriteLoading extends HomeTabState {
  final String productId;

  const SetFavoriteLoading(this.productId);

  @override
  List<Object?> get props => [productId];
}

class SetFavoriteSuccess extends HomeTabState {
  final String productId;
  final bool isFavorite;

  const SetFavoriteSuccess({
    required this.productId,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [productId, isFavorite];
}

class SetFavoriteError extends HomeTabState {
  final String message;

  const SetFavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
final class HomeTabError extends HomeTabState {
  final String message;

  HomeTabError( this.message);
}
class AddingToFavortie extends HomeTabState {}
class AddedToFavortie extends HomeTabState {}
class AddedToFavortieError extends HomeTabState {
    final String message;

  AddedToFavortieError( this.message);

}