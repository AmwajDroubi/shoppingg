import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/model/product_model.dart';
import 'package:shopping/pages/cart.dart';
import 'package:shopping/pages/favorite1.dart';
import 'package:shopping/pages/home.dart';
import 'package:shopping/pages/settings.dart';
import 'package:shopping/view_block/cart_cubit/cart_cubit.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
import 'package:shopping/view_block/profile_cubit/profile_cubit.dart';

class BottomNavBar extends StatefulWidget {
  final List<ProductModel> orderProduct;

  const BottomNavBar({
    Key? key,
    required this.orderProduct,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<ProductModel> favoriteItems = [];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        orderProduct: widget.orderProduct,
        addFavorite: addFavorite,
        removeFavorite: removeFavorite,
      ),
      BlocProvider(
          create: (context) {
            final cubit = CartCubit();
            cubit.getCartItems();
            return cubit;
          },
          child: CartPage()
          // CartP(orderProduct: widget.orderProduct),
          ),
      BlocProvider(
        create: (context) {
          final cubit = FavoriteCubit();
          cubit.loadFavorites(); // Load favorites initially
          return cubit;
        },
        child: FavoriteP(
          favoriteItems: favoriteItems,
          removeFavorite: removeFavorite,
        ),
      ),
      BlocProvider(
        create: (context) => ProfileCubit()..getProfileData(),
        child: const SettingP(),
      ),
    ];
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
