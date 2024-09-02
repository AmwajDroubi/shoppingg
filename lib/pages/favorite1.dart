// import 'package:flutter/material.dart';
// import 'package:shopping/model/l.dart';
// import 'package:shopping/model/product_model.dart';

// class FavoriteP extends StatefulWidget {
//   final List<ProductModel> favoriteItems;
//   final Function(ProductModel) removeFavorite;

//   FavoriteP({
//     super.key,
//     required this.favoriteItems,
//     required this.removeFavorite,
//   });

//   @override
//   State<FavoriteP> createState() => _FavoritePState();
// }

// class _FavoritePState extends State<FavoriteP> {
//   String? selectedCategoryId;
//   late List<ProductModel> filteredProduct;
//   final List<ProductModel> orderProduct = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   filteredProduct = dummyProduct;
//   // }

//   Map<ProductModel, int> itemCounts = {};

//   @override
//   void initState() {
//     super.initState();
//     for (var item in widget.favoriteItems) {
//       itemCounts[item] = 0;
//     }
//   }

//   void rem(ProductModel item) {
//     setState(() {
//       if (itemCounts[item]! > 0) itemCounts[item] = itemCounts[item]! - 1;
//     });
//   }

//   void ad(ProductModel item) {
//     setState(() {
//       itemCounts[item] = itemCounts[item]! + 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Favorite Items',
//           style: TextStyle(
//             fontSize: 30,
//             color: Colors.grey[800],
//             fontWeight: FontWeight.bold,
//             fontFamily: "EduTASBeginner",
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.notifications,
//                 size: 30,
//               ))
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               decoration: InputDecoration(
//                   hintText: "Search something",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   prefixIcon: const Icon(
//                     Icons.search,
//                     size: 30,
//                   ),
//                   suffixIcon: const Icon(
//                     Icons.manage_search_rounded,
//                     size: 30,
//                   )),
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SizedBox(
//             height: 100,
//             child: Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: ListView.builder(
//                 itemBuilder: (_, index) {
//                   final category = listcategory[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 10.0, bottom: 40),
//                     child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           if (selectedCategoryId == category.id) {
//                             selectedCategoryId = null;
//                             filteredProduct = dummyProduct;
//                           } else {
//                             selectedCategoryId = category.id;
//                             filteredProduct = dummyProduct
//                                 .where((product) =>
//                                     product.category.id == selectedCategoryId)
//                                 .toList();
//                           }
//                         });
//                       },
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: selectedCategoryId == category.id
//                               ? Colors.blue
//                               : const Color.fromARGB(255, 238, 236, 236),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Column(children: [
//                           const SizedBox(height: 5, width: 90),
//                           Text(
//                             category.name,
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: selectedCategoryId == category.id
//                                   ? Colors.white
//                                   : null,
//                             ),
//                           )
//                         ]),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: listcategory.length,
//                 scrollDirection: Axis.horizontal,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 400,
//             child: SingleChildScrollView(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 11,
//                 ),
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (_, index) {
//                   final item = widget.favoriteItems[index];
//                   return Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
//                     child: Stack(
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Container(
//                                 width: 400,
//                                 child: Container(
//                                     color: Colors.grey[300],
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                               right: 10,
//                                             ),
//                                             child: Image.asset(
//                                               item.imageUrl,
//                                               height: 100,
//                                               width: 120,
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                           Text(
//                                             item.name,
//                                             style:
//                                                 const TextStyle(fontSize: 23),
//                                           ),
//                                           Text(
//                                             "${item.price}",
//                                             style: const TextStyle(
//                                                 fontSize: 23,
//                                                 color: Colors.red),
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           bottom: 5,
//                           right: 7,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(30),
//                             child: Container(
//                               height: 35,
//                               width: 35,
//                               color: Colors.grey[400],
//                               child: const Icon(Icons.favorite,
//                                   size: 25, color: Colors.red),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 itemCount: widget.favoriteItems.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/model/l.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/l.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

class FavoriteP extends StatefulWidget {
  final List<ProductModel> favoriteItems;
  final Function(ProductModel) removeFavorite;

  FavoriteP({
    super.key,
    required this.favoriteItems,
    required this.removeFavorite,
  });

  @override
  State<FavoriteP> createState() => _FavoritePState();
}

class _FavoritePState extends State<FavoriteP> {
  String? selectedCategoryId;
  late List<ProductModel> filteredProduct;
  final List<ProductModel> orderProduct = [];
  List<ProductModel> favoritProduct =
      dummyProduct.where((p) => p.isFavorite).toList();

  // @override
  // void initState() {
  //   super.initState();
  //   filteredProduct = dummyProduct;
  // }

  Map<ProductModel, int> itemCounts = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.favoriteItems) {
      itemCounts[item] = 0;
    }
  }

  void rem(ProductModel item) {
    setState(() {
      if (itemCounts[item]! > 0) itemCounts[item] = itemCounts[item]! - 1;
    });
  }

  void ad(ProductModel item) {
    setState(() {
      itemCounts[item] = itemCounts[item]! + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
        bloc: favoriteCubit,
        buildWhen: (previous, current) =>
            current is FavoriteLoaded ||
            current is FavoriteLoading ||
            current is FavoriteError,
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Favorite Items',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontFamily: "EduTASBeginner",
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 30,
                      ))
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search something",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          suffixIcon: const Icon(
                            Icons.manage_search_rounded,
                            size: 30,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          final category = listcategory[index];

                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, bottom: 40),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedCategoryId == category.id) {
                                    selectedCategoryId = null;
                                    filteredProduct = dummyProduct;
                                  } else {
                                    selectedCategoryId = category.id;
                                    filteredProduct = dummyProduct
                                        .where((product) =>
                                            product.category.id ==
                                            selectedCategoryId)
                                        .toList();
                                  }
                                });
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: selectedCategoryId == category.id
                                      ? Colors.blue
                                      : const Color.fromARGB(
                                          255, 238, 236, 236),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(children: [
                                  const SizedBox(height: 5, width: 90),
                                  Text(
                                    category.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: selectedCategoryId == category.id
                                          ? Colors.white
                                          : null,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          );
                        },
                        itemCount: listcategory.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 11,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final item = widget.favoriteItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 400,
                                        child: Container(
                                            color: Colors.grey[300],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    child: Image.asset(
                                                      item.imageUrl,
                                                      height: 100,
                                                      width: 120,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Text(
                                                    item.name,
                                                    style: const TextStyle(
                                                        fontSize: 23),
                                                  ),
                                                  Text(
                                                    "${item.price}",
                                                    style: const TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 7,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      color: Colors.grey[400],
                                      child: const Icon(Icons.favorite,
                                          size: 25, color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: widget.favoriteItems.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FavoriteError) {
            return Center(child: Text("Error Page"));
          } else {
            return Container(
              color: Colors.black,
            );
          }
        });
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/model/l.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/pages/product_item.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

// class FavoriteP extends StatefulWidget {
//   const FavoriteP({super.key});

//   @override
//   State<FavoriteP> createState() => _FavoritePState();
// }

// class _FavoritePState extends State<FavoriteP> {
//   String? selectedCategoryId;
//   late List<ProductModel> filteredProduct;
//     List<ProductModel> favoriteProducts = dummyProduct.where((p) => p.isFavorite).toList();


//   @override
//   void initState() {
//     super.initState();
//     // You can initialize filteredProduct if needed
//     filteredProduct = dummyProduct;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

//     return BlocBuilder<FavoriteCubit, FavoriteState>(
//       builder: (context, state) {
//         if (state is FavoriteLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state is FavoriteLoaded) {
//           final favoriteItems = state.favoriteItems;

//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Favorite Items',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.grey[800],
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "EduTASBeginner",
//                 ),
//               ),
//               centerTitle: true,
//               actions: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.notifications, size: 30),
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search something",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       prefixIcon: const Icon(Icons.search, size: 30),
//                       suffixIcon: const Icon(Icons.manage_search_rounded, size: 30),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 SizedBox(
//                   height: 100,
//                   child: Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: ListView.builder(
//                       itemBuilder: (_, index) {
//                         final category = listcategory[index];

//                         return Padding(
//                           padding: const EdgeInsets.only(right: 10.0, bottom: 40),
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 if (selectedCategoryId == category.id) {
//                                   selectedCategoryId = null;
//                                   filteredProduct = dummyProduct;
//                                 } else {
//                                   selectedCategoryId = category.id;
//                                   filteredProduct = dummyProduct
//                                       .where((product) =>
//                                           product.category.id == selectedCategoryId)
//                                       .toList();
//                                 }
//                               });
//                             },
//                             child: DecoratedBox(
//                               decoration: BoxDecoration(
//                                 color: selectedCategoryId == category.id
//                                     ? Colors.blue
//                                     : const Color.fromARGB(255, 238, 236, 236),
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               child: Column(
//                                 children: [
//                                   const SizedBox(height: 5, width: 90),
//                                   Text(
//                                     category.name,
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: selectedCategoryId == category.id
//                                           ? Colors.white
//                                           : null,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       itemCount: listcategory.length,
//                       scrollDirection: Axis.horizontal,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                                         itemCount: favoriteProducts.length,

                    
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 5,
//                       mainAxisSpacing: 11,
//                     ),
                    
//                     itemBuilder: (_, index) {
//                       final item = favoriteProducts[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
//                         child: ProductItem(productItem: item),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else if (state is FavoriteError) {
//           return Center(child: Text("Error Page"));
//         } else {
//           return Container(color: Colors.black);
//         }
//       },
//     );
//   }
// }
