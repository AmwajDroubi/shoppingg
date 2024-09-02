// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // import 'package:shopping/model/product_model.dart';
// // // // import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';

// // // // class ProductItem extends StatefulWidget {
// // // //   final ProductModel productItem;
// // // //   const ProductItem({super.key, required this.productItem});

// // // //   @override
// // // //   State<ProductItem> createState() => _ProductItemState();
// // // // }

// // // // class _ProductItemState extends State<ProductItem> {
// // // //   bool? isFavorite;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     isFavorite = widget.productItem.isFavorite;
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final homeTabCubit = BlocProvider.of<HomeTabCubit>(context);

// // // //     return Column(
// // // //       children: [
// // // //         Stack(
// // // //           children: [
// // // //             Container(
// // // //               height: 105,
// // // //               width: 260,
// // // //               decoration: BoxDecoration(
// // // //                 borderRadius: BorderRadius.circular(16.0),
// // // //                 color: Colors.grey[200], // Fixed color to grey[200]
// // // //               ),
// // // //               child: ClipRRect(
// // // //                 borderRadius: BorderRadius.circular(
// // // //                     16.0), // Ensure it matches the Container's borderRadius
// // // //                 child: Image(
// // // //                   image: AssetImage(widget.productItem.imageUrl),
// // // //                   fit: BoxFit.cover, // Fit image properly within container
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             Align(
// // // //               alignment: Alignment.topRight,
// // // //               child: Container(
// // // //                 margin: const EdgeInsets.all(8.0), // Margin to avoid overlap
// // // //                 decoration: BoxDecoration(
// // // //                   shape: BoxShape.circle,
// // // //                   color: Colors.white54,
// // // //                 ),
// // // //                 child: InkWell(
// // // //                   onTap: () {
// // // //                     homeTabCubit.ToggleFavorite(widget.productItem);
// // // //                   },
// // // //                   child: BlocBuilder<HomeTabCubit, HomeTabState>(
// // // //                     bloc: homeTabCubit,
// // // //                     buildWhen: (previous, current) =>
// // // //                         (current is SetFavoriteLoading &&
// // // //                             current.favoritId == widget.productItem.id) ||
// // // //                         (current is SetFavoriteSuccess &&
// // // //                             current.favoritId == widget.productItem.id) ||
// // // //                         current is SetFavoriteError,
// // // //                     builder: (context, state) {
// // // //                       if (state is SetFavoriteLoading) {
// // // //                         return const CircularProgressIndicator.adaptive();
// // // //                       } else if (state is SetFavoriteSuccess) {
// // // //                         // Update isFavorite with the state value
// // // //                         isFavorite = state.isFavorite ?? false;
// // // //                         return Icon(
// // // //                             widget.productItem.isFavorite
// // // //                                 ? Icons.favorite
// // // //                                 : Icons.favorite_border,
// // // //                             size: 25,
// // // //                             color: Colors.red);
// // // //                       }
// // // //                       return Icon(
// // // //                         Icons.favorite_border,
// // // //                         color: Colors.green[500],
// // // //                       );
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         const SizedBox(height: 4.0),
// // // //         Text(
// // // //           widget.productItem.name,
// // // //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
// // // //                 fontWeight: FontWeight.w600,
// // // //               ),
// // // //         ),
// // // //         Text(
// // // //           widget.productItem.category.name,
// // // //           style: Theme.of(context).textTheme.labelMedium!.copyWith(
// // // //                 color: Colors.grey,
// // // //               ),
// // // //         ),
// // // //         Text(
// // // //           '\$${widget.productItem.price}',
// // // //           style: Theme.of(context).textTheme.titleSmall!.copyWith(
// // // //                 fontWeight: FontWeight.w600,
// // // //               ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:shopping/model/product_model.dart';
// // // import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';

// // // class ProductItem extends StatelessWidget {
// // //   final ProductModel productItem;

// // //   const ProductItem({super.key, required this.productItem});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final homeTabCubit = BlocProvider.of<HomeTabCubit>(context);

// // //     return BlocBuilder<HomeTabCubit, HomeTabState>(
// // //       builder: (context, state) {
// // //         bool isFavorite = false;
// // //         if (state is SetFavoriteSuccess && state.isFavorite) {
// // //           isFavorite = true;
// // //         }
// // //         return Column(
// // //           children: [
// // //             Stack(
// // //               children: [
// // //                 Container(
// // //                   height: 105,
// // //                   width: 260,
// // //                   decoration: BoxDecoration(
// // //                     borderRadius: BorderRadius.circular(16.0),
// // //                     color: Colors.grey[200],
// // //                   ),
// // //                   child: ClipRRect(
// // //                     borderRadius: BorderRadius.circular(16.0),
// // //                     child: Image(
// // //                       image: AssetImage(productItem.imageUrl),
// // //                       fit: BoxFit.cover,
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 Align(
// // //                   alignment: Alignment.topRight,
// // //                   child: Container(
// // //                     margin: const EdgeInsets.all(8.0),
// // //                     decoration: BoxDecoration(
// // //                       shape: BoxShape.circle,
// // //                       color: Colors.white54,
// // //                     ),
// // //                     child: InkWell(
// // //                       onTap: () {
// // //                         homeTabCubit.ToggleFavorite(productItem);
// // //                       },
// // //                       child: Icon(
// // //                         isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                         size: 25,
// // //                         color: Colors.red,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 4.0),
// // //             Text(
// // //               productItem.name,
// // //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
// // //                     fontWeight: FontWeight.w600,
// // //                   ),
// // //             ),
// // //             Text(
// // //               productItem.category.name,
// // //               style: Theme.of(context).textTheme.labelMedium!.copyWith(
// // //                     color: Colors.grey,
// // //                   ),
// // //             ),
// // //             Text(
// // //               '\$${productItem.price}',
// // //               style: Theme.of(context).textTheme.titleSmall!.copyWith(
// // //                     fontWeight: FontWeight.w600,
// // //                   ),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:shopping/model/product_model.dart';
// // import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
// // import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

// // class ProductItem extends StatelessWidget {
// //   final ProductModel productItem;

// //   const ProductItem({super.key, required this.productItem});

// //   @override
// //   Widget build(BuildContext context) {
// //     final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

// //     return BlocBuilder<FavoriteCubit, FavoriteState>(
// //       builder: (context, state) {
// //         bool isFavorite = false;

// //         if (state is FavoriteLoaded) {
// //           isFavorite = state.favoriteItems.contains(productItem);
// //         }

// //         return Column(
// //           children: [
// //             Stack(
// //               children: [
// //                 Container(
// //                   height: 105,
// //                   width: 260,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(16.0),
// //                     color: Colors.grey[200],
// //                   ),
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(16.0),
// //                     child: Image.asset(
// //                       productItem.imageUrl,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //                 Align(
// //                   alignment: Alignment.topRight,
// //                   child: Container(
// //                     margin: const EdgeInsets.all(8.0),
// //                     decoration: BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       color: Colors.white54,
// //                     ),
// //                     child: IconButton(
// //                       onPressed: () {
// //                         favoriteCubit.toggleFavorite(productItem);
// //                       },
// //                       icon: Icon(
// //                         isFavorite ? Icons.favorite : Icons.favorite_border,
// //                         size: 25,
// //                         color: Colors.red,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 4.0),
// //             Text(
// //               productItem.name,
// //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //             ),
// //             Text(
// //               productItem.category.name,
// //               style: Theme.of(context).textTheme.labelMedium!.copyWith(
// //                     color: Colors.grey,
// //                   ),
// //             ),
// //             Text(
// //               '\$${productItem.price}',
// //               style: Theme.of(context).textTheme.titleSmall!.copyWith(
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

// class ProductItem extends StatelessWidget {
//   final ProductModel productItem;

//   const ProductItem({super.key, required this.productItem});

//   @override
//   Widget build(BuildContext context) {
//     // This widget assumes that the cubit is provided in an ancestor widget
//     final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

//     return BlocBuilder<FavoriteCubit, FavoriteState>(
//       builder: (context, state) {
//         bool isFavorite = false;
//         if (state is FavoriteLoaded) {
//           isFavorite = state.favoriteItems.contains(productItem);
//         }

//         return Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 105,
//                   width: 260,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.0),
//                     color: Colors.grey[200],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16.0),
//                     child: Image.asset(
//                       productItem.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     margin: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white54,
//                     ),
//                     child: IconButton(
//                       onPressed: () {
//                         if (isFavorite) {
//                           context.read<FavoriteCubit>().removeFavorite(productItem);
//                         } else {
//                           context.read<FavoriteCubit>().addFavorite(productItem);
//                         }
//                       },
//                       icon: Icon(
//                         isFavorite ? Icons.favorite : Icons.favorite_border,
//                         size: 25,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4.0),
//             Text(
//               productItem.name,
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//             ),
//             Text(
//               productItem.category.name,
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Colors.grey,
//                   ),
//             ),
//             Text(
//               '\$${productItem.price}',
//               style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

// class ProductItem extends StatelessWidget {
//   final ProductModel productItem;

//   const ProductItem({super.key, required this.productItem});

//   @override
//   Widget build(BuildContext context) {
//     final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

//     return BlocBuilder<FavoriteCubit, FavoriteState>(
//       builder: (context, state) {
//         bool isFavorite = false;
//         if (state is FavoriteLoaded) {
//           isFavorite = state.favoriteItems.contains(productItem);
//         }

//         return Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 105,
//                   width: 260,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.0),
//                     color: Colors.grey[200],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16.0),
//                     child: Image.asset(
//                       productItem.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     margin: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white54,
//                     ),
//                     child: IconButton(
//                       onPressed: () {
//                         if (isFavorite) {
//                           favoriteCubit.removeFavorite(productItem);
//                         } else {
//                           favoriteCubit.addFavorite(productItem);
//                         }
//                       },
//                       icon: Icon(
//                         isFavorite ? Icons.favorite : Icons.favorite_border,
//                         size: 25,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4.0),
//             Text(
//               productItem.name,
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//             ),
//             Text(
//               productItem.category.name,
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Colors.grey,
//                   ),
//             ),
//             Text(
//               '\$${productItem.price}',
//               style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

//////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

// class ProductItem extends StatelessWidget {
//   final ProductModel productItem;

//   const ProductItem({super.key, required this.productItem});

//   @override
//   Widget build(BuildContext context) {
//     final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

//     return BlocBuilder<FavoriteCubit, FavoriteState>(
//       builder: (context, state) {
//         bool isFavorite = false;
//         if (state is FavoriteLoaded) {
//           isFavorite = state.favoriteItems.contains(productItem);
//         }

//         return Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 105,
//                   width: 260,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.0),
//                     color: Colors.grey[200],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16.0),
//                     child: Image.asset(
//                       productItem.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     margin: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white54,
//                     ),
//                     child: IconButton(
//                       onPressed: () {

//                         if (isFavorite) {
//                           context
//                               .read<FavoriteCubit>()
//                               .removeFavorite(productItem);
//                         } else {
//                           context
//                               .read<FavoriteCubit>()
//                               .addFavorite(productItem);
//                         }
//                       },
//                       icon: Icon(
//                         isFavorite ? Icons.favorite : Icons.favorite_border,
//                         size: 25,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4.0),
//             Text(
//               productItem.name,
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//             ),
//             Text(
//               productItem.category.name,
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Colors.grey,
//                   ),
//             ),
//             Text(
//               '\$${productItem.price}',
//               style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_state.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productItem;

  const ProductItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoriteLoaded) {
          isFavorite = state.favoriteItems.contains(productItem);
        }

        return Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 105,
                  width: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      productItem.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white54,
                    ),
                    child: IconButton(
                      onPressed: () {
                        favoriteCubit.addFavorite(productItem);
                        if (isFavorite) {
                          context
                              .read<FavoriteCubit>()
                              .removeFavorite(productItem);
                        } else {
                          context
                              .read<FavoriteCubit>()
                              .addFavorite(productItem);
                        }
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              productItem.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              productItem.category.name,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            Text(
              '\$${productItem.price}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        );
      },
    );
  }
}
