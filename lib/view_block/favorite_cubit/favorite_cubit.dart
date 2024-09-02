// // import 'package:bloc/bloc.dart';
// // import 'package:meta/meta.dart';
// // import 'package:shopping/model/product_model.dart';
// // import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

// // class FavoriteCubit extends Cubit<FavoriteState> {
// //   FavoriteCubit() : super(FavoriteInitial());
// //   List<ProductModel> _favoriteItems = [];

// //   void loadFavorites() async {
// //     emit(FavoriteLoading());
// //     // Simulate network delay
// //     await Future.delayed(Duration(seconds: 1));
// //     // Load favorite items (replace with actual data)
// //     emit(FavoriteLoaded(_favoriteItems));
// //   }

// //   void addFavorite(ProductModel product) {
// //     _favoriteItems.add(product);
// //     emit(FavoriteLoaded(_favoriteItems));
// //   }

// //   // Remove a product from favorites
// //   void removeFavorite(ProductModel product) {
// //     _favoriteItems.remove(product);
// //     emit(FavoriteLoaded(_favoriteItems));
// //   }

// //   void toggleFavorite(ProductModel product) {
// //     // Simulate network delay
// //     emit(FavoriteLoading());
// //     Future.delayed(Duration(seconds: 1), () {
// //       if (_favoriteItems.contains(product)) {
// //         _favoriteItems.remove(product);
// //       } else {
// //         _favoriteItems.add(product);
// //       }
// //       emit(FavoriteLoaded(_favoriteItems));
// //     });
// //   }
// // }

// import 'package:bloc/bloc.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

// class FavoriteCubit extends Cubit<FavoriteState> {
//   FavoriteCubit() : super(FavoriteInitial());

//   final List<ProductModel> _favoriteItems = [];

//   List<ProductModel> get favoriteItems => _favoriteItems;

//   void addFavorite(ProductModel product) {
//     favoriteItems.add(product);
//     emit(FavoriteLoaded(favoriteItems));
//   }

//   void removeFavorite(ProductModel product) {
//     favoriteItems.remove(product);
//     emit(FavoriteLoaded(favoriteItems));
//   }
//     void toggleFavorite(ProductModel product) {
//       // Simulate network delay
//       emit(FavoriteLoading());
//       Future.delayed(Duration(seconds: 1), () {
//         if (_favoriteItems.contains(product)) {
//           _favoriteItems.remove(product);
//         } else {
//           _favoriteItems.add(product);
//         }
//         emit(FavoriteLoaded(favoriteItems));
//       });
//     }

//     void loadFavorites() async {
//       emit(FavoriteLoading());
//       // Simulate network delay
//       await Future.delayed(Duration(seconds: 1));
//       // Load favorite items (replace with actual data)
//       emit(FavoriteLoaded(favoriteItems));
//     }
//   }

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:shopping/model/category_model.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final List<ProductModel> _favoriteItems = [];

  List<ProductModel> get favoriteItems => _favoriteItems;

  void addFavorite(ProductModel product) {
    if (!_favoriteItems.contains(product)) {
      _favoriteItems.add(product);
      emit(FavoriteLoaded(List.from(_favoriteItems)));
    }
  }

  void removeFavorite(ProductModel product) {
    if (_favoriteItems.contains(product)) {
      _favoriteItems.remove(product);
      emit(FavoriteLoaded(List.from(_favoriteItems)));
    }
  }

  void toggleFavorite(ProductModel product) {
    emit(FavoriteLoading());
    Future.delayed(Duration(seconds: 1), () {
      if (_favoriteItems.contains(product)) {
        _favoriteItems.remove(product);
      } else {
        _favoriteItems.add(product);
      }
      emit(FavoriteLoaded(List.from(_favoriteItems)));
    });
  }

  void loadFavorites() async {
    emit(FavoriteLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(FavoriteLoaded(List.from(_favoriteItems)));
  }

  // Future<void> addToFavorite(ProductModel product) async {
  //   emit(AddingToFavortie());
  //   try {
  //     final cartOrder = ProductModel(
  //       id: DateTime.now().toIso8601String(),
  //       name: 'l',
  //       imageUrl: 'assets/shop/0.jpg',
  //       price: 1000,
  //       category: dummyCategories[0],
  //     );
  //     dummyProduct.add(cartOrder);
  //     emit(AddedToFavortie());
  //   } catch (e) {
  //     emit(AddedToFavortieError(e.toString()));
  //   }
  // }
}
