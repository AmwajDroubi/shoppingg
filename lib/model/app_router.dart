
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/app_routs.dart';
import 'package:shopping/pages/login.dart';
import 'package:shopping/pages/product_details.dart';
import 'package:shopping/view_block/auth_cubit/auth_cubit.dart';
import 'package:shopping/view_block/product_details_cubit/product_details_cubit.dart';
import 'package:shopping/widget/nav_bar.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final productId = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(productId);
              return cubit;
            },
            child: const ProductDetailsPage(),
          ),
        );
      case AppRoutes.home:
        return CupertinoPageRoute(
          builder: (_) => const BottomNavBar(orderProduct: [],),
        );
      case AppRoutes.signIn:
      default:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignInPage(),
          ),
        );
    }
  }
}