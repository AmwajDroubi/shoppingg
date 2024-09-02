import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/pages/product_details.dart';
import 'package:shopping/pages/slider.dart';
import 'package:shopping/pages/product_item.dart';
import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';
import 'package:shopping/view_block/home_cubit/home_tab_state.dart';
import 'package:shopping/view_block/product_details_cubit/product_details_cubit.dart';

class HomeTabInnerPage extends StatelessWidget {
  const HomeTabInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeTabCubit = BlocProvider.of<HomeTabCubit>(context);

    return BlocBuilder<HomeTabCubit, HomeTabState>(
      bloc: homeTabCubit,
      buildWhen: (previous, current) =>
          current is HomeTabLoaded ||
          current is HomeTabLoading ||
          current is HomeTabError,
      builder: (context, state) {
        if (state is HomeTabLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeTabLoaded) {
          final announcements = state.annonsenousImage;
          final products = state.products;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.27,
                    child: MyImageSlider(annansumns: announcements),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrivals ⚡🔥✨💫',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) {
                                  final cubit = ProductDetailsCubit();
                                  cubit.getProductDetails(products[index].id);
                                  return cubit;
                                },
                                child: const ProductDetailsPage(),
                              ),
                            ),
                          );
                        },
                        child: ProductItem(
                          productItem: products[index],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        } else if (state is HomeTabError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
