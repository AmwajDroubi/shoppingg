import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';
import 'package:shopping/view_block/home_cubit/home_tab_state.dart';

class FavoritesPage extends StatelessWidget {
     const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeTabCubit = BlocProvider.of<HomeTabCubit>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: BlocBuilder<HomeTabCubit, HomeTabState>(
        builder: (context, state) {
          final favorites = homeTabCubit.getFavorites();

          if (favorites.isEmpty) {
            return Center(child: Text('No favorites yet'));
          }

          return GridView.builder(
            itemCount: favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 11,
              crossAxisCount: 2,
            ),
            itemBuilder: (_, index) {
              final ProductModel product = favorites[index];
              return Card(
                child: Column(
                  children: [
                    Image.asset(product.imageUrl, fit: BoxFit.cover),
                    Text(product.name),
                    Text('\$${product.price}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
