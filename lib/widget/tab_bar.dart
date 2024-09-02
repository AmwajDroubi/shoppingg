// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/pages/category.dart';
// import 'package:shopping/pages/product.dart';
// import 'package:shopping/pages/settings.dart';

// class TabBarP extends StatefulWidget {
//   final Function(ProductModel) addFavorite;
//   final Function(ProductModel) removeFavorite;
//   final List<ProductModel> orderProduct;
//   const TabBarP({
//     Key? key,
//     required this.addFavorite,
//     required this.removeFavorite,
//     required this.orderProduct,
//   }) : super(key: key);

//   @override
//   State<TabBarP> createState() => _TabBarPState();
// }

// class _TabBarPState extends State<TabBarP> {
//   List<ProductModel> favoriteItems = [];

//   void addFavorite(ProductModel product) {
//     setState(() {
//       favoriteItems.add(product);
//     });
//   }

//   void removeFavorite(ProductModel product) {
//     setState(() {
//       favoriteItems.remove(product);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(

//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: const TabBar(
//             tabs: [

//             Tab(
//               text: "Home",
//             ),
//             Tab(
//               text: "Category",
//             )
//           ]),
//         ),
//         body: TabBarView(

//           children: [

//           ProductP(

//             favoriteItems: favoriteItems,
//             addFavorite: addFavorite,
//             removeFavorite: removeFavorite,
//             orderProduct: widget.orderProduct,
//           ),
//           CategoryP()
//         ]),
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
import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart'; // Assuming you have this

class HomePage extends StatefulWidget {
  final Function(ProductModel) addFavorite;
  final Function(ProductModel) removeFavorite;
  final List<ProductModel> orderProduct;

  const HomePage({
    Key? key,
    required this.addFavorite,
    required this.removeFavorite,
    required this.orderProduct,
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
                    child: ProductP(
                      favoriteItems: favoriteItems,
                      addFavorite: widget.addFavorite,
                      removeFavorite: widget.removeFavorite,
                      orderProduct: widget.orderProduct,
                    ),
                  ),
                  CategoryP(
                      // categories: categories,
                      // products: products,
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
