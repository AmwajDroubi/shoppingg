// import 'package:flutter/material.dart';
// import 'package:shopping/model/category_model.dart';
// import 'package:shopping/model/product_model.dart';

// class CategoryP extends StatefulWidget {
//   const CategoryP({super.key});

//   @override
//   State<CategoryP> createState() => _CategoryPState();
// }

// class _CategoryPState extends State<CategoryP> {
//   String? selectedCategoryId;
//   late List<ProductModel> filteredProduct;
//   final List<ProductModel> orderProduct = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredProduct = dummyProduct;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: 650,
//         child: ListView.builder(
//           itemBuilder: (_, index) {
//             final category = dummyCategories[index];
//             return InkWell(
//                 onTap: () {
//                   setState(() {
//                     if (selectedCategoryId == category.id) {
//                       selectedCategoryId = null;
//                       filteredProduct = dummyProduct;
//                     } else {
//                       selectedCategoryId = category.id;
//                       filteredProduct = dummyProduct
//                           .where((product) =>
//                               product.category.id == selectedCategoryId)
//                           .toList();
//                     }
//                   });
//                 },
//                 child: ListTile(
//                     title: Stack(
//                   children: [
//                     Image.asset(
//                       category.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                     Positioned(
//                         left: 25,
//                         child: Text(
//                           category.name,
//                           style: const TextStyle(
//                               fontSize: 38,
//                               fontFamily: "PlayfairDisplay",
//                               fontWeight: FontWeight.w800,
//                               color: Colors.black),
//                         ))
//                   ],
//                 )));
//           },
//           itemCount: dummyCategories.length,
//           scrollDirection: Axis.vertical,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/category_model.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/view_block/categor_cubit/category_cubit_cubit.dart';
import 'package:shopping/view_block/categor_cubit/category_cubit_state.dart';
import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';
import 'package:shopping/view_block/home_cubit/home_tab_state.dart';

class CategoryP extends StatefulWidget {
  const CategoryP({super.key});

  @override
  State<CategoryP> createState() => _CategoryPState();
}

class _CategoryPState extends State<CategoryP> {
  String? selectedCategoryId;
  late List<ProductModel> filteredProduct;
  final List<ProductModel> orderProduct = [];

  @override
  void initState() {
    super.initState();
    filteredProduct = dummyProduct;
  }

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoryCubit>(context);
    return BlocBuilder<CategoryCubit, CategoryState>(
        bloc: categoryCubit,
        buildWhen: (previous, current) =>
            current is CategoryLoaded ||
            current is CategoryLoading ||
            current is CategoryError,
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoaded) {
            return Scaffold(
              body: SizedBox(
                height: 650,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final category = dummyCategories[index];
                    return InkWell(
                        onTap: () {
                          setState(() {
                            if (selectedCategoryId == category.id) {
                              selectedCategoryId = null;
                              filteredProduct = dummyProduct;
                            } else {
                              selectedCategoryId = category.id;
                              filteredProduct = dummyProduct
                                  .where((product) =>
                                      product.category.id == selectedCategoryId)
                                  .toList();
                            }
                          });
                        },
                        child: ListTile(
                            title: Stack(
                          children: [
                            Image.asset(
                              category.imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                                left: 25,
                                child: Text(
                                  category.name,
                                  style: const TextStyle(
                                      fontSize: 38,
                                      fontFamily: "PlayfairDisplay",
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ))
                          ],
                        )));
                  },
                  itemCount: dummyCategories.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            );
          } else if (state is HomeTabError) {
            return Center(child: Text("Error Page"));
          } else {
            return Container(
              color: Colors.black,
            );
          }
        });
  }
}
