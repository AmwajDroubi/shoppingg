// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/model/category_model.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/pages/category.dart';
// import 'package:shopping/pages/product.dart';
// import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart'; // Assuming you have this

// class HomePage extends StatefulWidget {
//   final Function(ProductModel) addFavorite;
//   final Function(ProductModel) removeFavorite;
//   final List<ProductModel> orderProduct;
//  // final ProductModel product;

//   const HomePage({
//     Key? key,
//     required this.addFavorite,
//     required this.removeFavorite,
//     required this.orderProduct,
//     // required this.product,
//   }) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<ProductModel> favoriteItems = [];

//   // Define dummy data or retrieve it from somewhere
//   final List<CategoryModel> categories = dummyCategories;
//   final List<ProductModel> products = dummyProduct;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: "Home"),
//               Tab(text: "Category"),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               flex: 3,
//               child: TabBarView(
//                 children: [
//                   BlocProvider(
//                     create: (context) {
//                       final cubit = HomeTabCubit();
//                       cubit.getHomeData();
//                       return cubit;
//                     },
//                     child: ProductP(
//                       favoriteItems: favoriteItems,
//                       addFavorite: widget.addFavorite,
//                       removeFavorite: widget.removeFavorite,
//                       orderProduct: widget.orderProduct,
//                     //  product: widget.product,
//                     ),
//                   ),
//                   CategoryP(
//                     categories: categories,
//                     products: products,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/category_model.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/pages/category.dart';
import 'package:shopping/pages/product.dart';
import 'package:shopping/pages/homeTabEnnarPage.dart';
import 'package:shopping/view_block/categor_cubit/category_cubit_cubit.dart';
import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart'; // Assuming you have this

class HomePage extends StatefulWidget {
  final Function(ProductModel) addFavorite;
  final Function(ProductModel) removeFavorite;
  final List<ProductModel> orderProduct;
  // final ProductModel product;

  const HomePage({
    Key? key,
    required this.addFavorite,
    required this.removeFavorite,
    required this.orderProduct,
    // required this.product,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> favoriteItems = [];

  // Define dummy data or retrieve it from somewhere
  final List<CategoryModel> categories = dummyCategories;
  final List<ProductModel> products = dummyProduct;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Category"),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: TabBarView(
                children: [
                  BlocProvider(
                    create: (context) {
                      final cubit = HomeTabCubit();
                      cubit.getHomeData();
                      return cubit;
                    },
                      child: HomeTabInnerPage(),
                    // child: ProductP(
                    //   favoriteItems: favoriteItems,
                    //   addFavorite: widget.addFavorite,
                    //   removeFavorite: widget.removeFavorite,
                    //   orderProduct: widget.orderProduct,
                    //   //  product: widget.product,
                    // ),
                  ),
                  BlocProvider(
                    create: (context) {
                      final cubit = CategoryCubit();
                      cubit.getCategoryData();
                      return cubit;
                    },
                    child: CategoryP(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
