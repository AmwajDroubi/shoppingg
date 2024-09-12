// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/model/category_model.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/services/home_services.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';
// import 'package:shopping/view_block/home_cubit/home_tab_state.dart';

// class HomeTabCubit extends Cubit<HomeTabState> {
//   HomeTabCubit() : super(HomeTabInitial());
//   final homeServices = HomeServices();

//   final List<Image> myitems = [
//     Image.asset('assets/shop/0.jpg'),
//     Image.asset('assets/shop/1.jpg'),
//     Image.asset('assets/shop/2.jpg'),
//     Image.asset('assets/shop/3.jpg'),
//     Image.asset('assets/shop/4.jpg'),
//     Image.asset('assets/shop/5.jpg'),
//   ];
//   List<ProductModel> products = [];
//   List<ProductModel> favoriteProducts = []; // قائمة المفضلة

//   Future<void> getHomeData() async {        emit(HomeTabLoading());
//     try {
//       final products = await homeServices.getProducts();
//       emit(
//         HomeTabLoaded(
//           products: products, annonsenousImage: myitems, announcementsImages: [],
//         ),
//       );
//     } catch (e) {
//       emit(HomeTabError(e.toString()));
//     }
//     // emit(HomeTabLoading());
//     // Future.delayed(const Duration(seconds: 1), () {
//     //   final products = dummyProduct;
//     //   emit(
//     //     HomeTabLoaded(annonsenousImage: myitems, products: products, announcementsImages: []),
//     //   );
//     // });
//   }

//   void ToggleFavorite(ProductModel product) {
//     emit(SetFavoriteLoading(product.id));
//     Future.delayed(Duration(seconds: 1), () {
//       final index = products.indexWhere((p) => p.id == product.id);
//       if (index != -1) {
//         bool newFavoriteStatus = !products[index].isFavorite;
//         products[index].isFavorite = newFavoriteStatus;

//         if (newFavoriteStatus) {
//           favoriteProducts.add(products[index]);
//         } else {
//           favoriteProducts.removeWhere((p) => p.id == product.id);
//         }

//         emit(SetFavoriteSuccess(
//           productId: product.id,
//           isFavorite: newFavoriteStatus,
//         ));
//       } else {
//         emit(SetFavoriteError('Product not found'));
//       }
//     });
//   }

//   Future<void> addToFavorite(ProductModel product) async {
//     emit(AddingToFavortie());
//     try {
//       final cartOrder = ProductModel(
//         id: DateTime.now().toIso8601String(),
//         name: 'l',
//         imageUrl: 'assets/shop/0.jpg',
//         price: 1000,
//         category: dummyCategories[0],
//       );
//       dummyProduct.add(cartOrder);
//       emit(AddedToFavortie());
//     } catch (e) {
//       emit(AddedToFavortieError(e.toString()));
//     }
//   }
//   List<ProductModel> getFavorites() {
//     return favoriteProducts;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/view_block/home_cubit/home_tab_state.dart';

// //part 'home_tab_state.dart';

// class HomeTabCubit extends Cubit<HomeTabState> {
//   HomeTabCubit() : super(HomeTabInitial());

//   final List<Image> myitems = [
//     Image.asset('assets/shop/0.jpg'),
//     Image.asset('assets/shop/1.jpg'),
//     Image.asset('assets/shop/2.jpg'),
//     Image.asset('assets/shop/3.jpg'),
//     Image.asset('assets/shop/4.jpg'),
//     Image.asset('assets/shop/5.jpg'),
//   ];
//   List<ProductModel> products = [];

//     void getHomeData() {
//     emit(HomeTabLoading());
//     Future.delayed(const Duration(seconds: 1), () {
//       final products = dummyProduct;
//       emit(
//         HomeTabLoaded(annonsenousImage: myitems, products: products),
//       );
//     });
//   }

//   void ToggleFavorite(ProductModel product) {
//     emit(SetFavoriteLoading(product.id));
//     Future.delayed(Duration(seconds: 1), () {
//       final index = products.indexWhere((p) => p.id == product.id);
//       if (index != -1) {
//         bool newFavoriteStatus = !products[index].isFavorite;
//         products[index].isFavorite = newFavoriteStatus;
//         emit(SetFavoriteSuccess(
//           productId: product.id,
//           isFavorite: newFavoriteStatus,
//           isfavort: newFavoriteStatus, // إذا كان هذا الحقل ضروري، تأكد من أنه يعكس حالة المفضلة بشكل صحيح
//           favoritedId: product.id,
//         ));
//       } else {
//         emit(SetFavoriteError('Product not found'));
//       }
//     });
//   }

// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/category_model.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/services/home_services.dart';
import 'package:shopping/view_block/home_cubit/home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTabInitial());
  final homeServices = HomeServices();

  final List<Image> myitems = [
    Image.asset('assets/shop/0.jpg'),
    Image.asset('assets/shop/1.jpg'),
    Image.asset('assets/shop/2.jpg'),
    Image.asset('assets/shop/3.jpg'),
    Image.asset('assets/shop/4.jpg'),
    Image.asset('assets/shop/5.jpg'),
  ];
  List<ProductModel> products = [];
  List<ProductModel> favoriteProducts = []; // قائمة المفضلة

  Future<void> getHomeData() async {
    emit(HomeTabLoading());

    try {
      // Future.delayed(const Duration(seconds: 1), () {
      final products = await homeServices.getProducts();
      emit(
        HomeTabLoaded(annonsenousImage: myitems, products: products),
      );
      // }
      //);
    } catch (e) {
      emit(HomeTabError(e.toString()));
    }
  }

  void ToggleFavorite(ProductModel product) {
    emit(SetFavoriteLoading(product.id));
    Future.delayed(Duration(seconds: 1), () {
      final index = products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        bool newFavoriteStatus = !products[index].isFavorite;
        products[index].isFavorite = newFavoriteStatus;

        if (newFavoriteStatus) {
          favoriteProducts.add(products[index]);
        } else {
          favoriteProducts.removeWhere((p) => p.id == product.id);
        }

        emit(SetFavoriteSuccess(
          productId: product.id,
          isFavorite: newFavoriteStatus,
        ));
      } else {
        emit(SetFavoriteError('Product not found'));
      }
    });
  }

  Future<void> addToFavorite(ProductModel product) async {
    emit(AddingToFavortie());
    try {
      final cartOrder = ProductModel(
        id: DateTime.now().toIso8601String(),
        name: 'l',
        imageUrl: 'assets/shop/0.jpg',
        price: 1000,
        category: dummyCategories[0],
      );
      dummyProduct.add(cartOrder);
      emit(AddedToFavortie());
    } catch (e) {
      emit(AddedToFavortieError(e.toString()));
    }
  }

  List<ProductModel> getFavorites() {
    return favoriteProducts;
  }
}
