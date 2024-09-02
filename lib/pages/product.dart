import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/pages/product_details.dart';
import 'package:shopping/pages/slider.dart';
import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';
import 'package:shopping/view_block/home_cubit/home_tab_state.dart';
import 'package:shopping/view_block/product_details_cubit/product_details_cubit.dart';

class ProductP extends StatefulWidget {
  final List<ProductModel> favoriteItems;
  final Function(ProductModel) addFavorite;
  final Function(ProductModel) removeFavorite;
  final List<ProductModel> orderProduct;

  const ProductP({
    Key? key,
    required this.favoriteItems,
    required this.addFavorite,
    required this.removeFavorite,
    required this.orderProduct,
  }) : super(key: key);

  @override
  State<ProductP> createState() => _ProductPState();
}

class _ProductPState extends State<ProductP> {
  late List<ProductModel> filteredProduct;
  List<ProductModel> favoriteItems = [];

  void addFavorite(ProductModel product) {
    setState(() {
      favoriteItems.add(product);
    });
  }

  void removeFavorite(ProductModel product) {
    setState(() {
      favoriteItems.remove(product);
    });
  }

  @override
  void initState() {
    super.initState();
    filteredProduct = dummyProduct;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeTabCubit = BlocProvider.of<HomeTabCubit>(context);

    return BlocBuilder<HomeTabCubit, HomeTabState>(
      bloc: homeTabCubit,
      buildWhen: (previous, current) =>
          current is HomeTabLoaded ||
          current is HomeTabLoading ||
          current is HomeTabError ||
          current is SetFavoriteSuccess,
      builder: (context, state) {
        if (state is HomeTabLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeTabLoaded) {
          final announcements = state.annonsenousImage;
          final products = state.products;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 220,
                      child: MyImageSlider(
                        annansumns: announcements,
                      ),
                    ),
                    SizedBox(height: 30),
                    GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 11,
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final ProductModel product = products[index];
                        final bool isFavorite = product.isFavorite;

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) {
                                    final cubit = ProductDetailsCubit();
                                    cubit.getProductDetails(product.id);
                                    return cubit;
                                  },
                                  child: ProductDetailsPage(),
                                ),
                              ),
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 238, 236, 236),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 27, right: 15, top: 9),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(9),
                                        child: Image.asset(
                                          product.imageUrl,
                                          height: 90,
                                          width: 130,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        color:
                                            Color.fromARGB(255, 65, 165, 132),
                                      ),
                                    ),
                                    Text(
                                      "${product.price}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 206, 51, 98),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 7,
                                  child: InkWell(
                                    onTap: () {
                                      homeTabCubit.ToggleFavorite(product);
                                      homeTabCubit.addToFavorite(product);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        color: Colors.grey[400],
                                        child: BlocBuilder<HomeTabCubit,
                                            HomeTabState>(
                                          bloc: homeTabCubit,
                                          buildWhen: (previous, current) =>
                                              current is SetFavoriteLoading ||
                                              current is SetFavoriteSuccess ||
                                              current is SetFavoriteError,
                                          builder: (context, state) {
                                            if (state is SetFavoriteLoading) {
                                              return CircularProgressIndicator
                                                  .adaptive();
                                            } else if (state
                                                    is SetFavoriteSuccess &&
                                                state.productId == product.id) {
                                              widget.removeFavorite(product);

                                              return Icon(
                                                product.isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 25,
                                                color: product.isFavorite
                                                    ? Colors.red
                                                    : Colors.red[600],
                                              );
                                            }
                                            // widget.removeFavorite(product);

                                            return Icon(
                                              product.isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              size: 25,
                                              color: product.isFavorite
                                                  ? Colors.red
                                                  : Colors.red[600],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
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
      },
    );
  }
}
