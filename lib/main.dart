// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shopping/model/cart_model.dart';
// // import 'package:shopping/model/category_model.dart';
// // import 'package:shopping/model/product_model.dart';
// // import 'package:shopping/pages/satart.dart';
// // import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';
// // import 'package:shopping/widget/nav_bar.dart';

// // void main() {
// //   runApp(
// //     MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(
// //             create: (_) => CartModel(nam: "perfum", pric: 130)),
// //         // Add other providers as needed
// //       ],
// //       child: const MyApp(),
// //     ),
// //   );
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: BlocProvider(
// //         create: (context) => HomeTabCubit()..getHomeData(),
// //         child: BottomNavBar(
// //           orderProduct: dummyProduct,
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/firebase_options.dart';
// import 'package:shopping/model/app_router.dart';
// import 'package:shopping/model/app_routs.dart';
// import 'package:shopping/pages/login.dart';
// import 'package:shopping/view_block/auth_cubit/auth_cubit.dart';
// import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
// import 'package:shopping/view_block/cart_cubit/cart_cubit.dart';
// import 'package:shopping/view_block/profile_cubit/profile_cubit.dart';
// import 'package:shopping/widget/nav_bar.dart';
// import 'package:firebase_core/firebase_core.dart';

// Future<void> main() async {
//   await initializeApp();
//   runApp(MyApp());
// }

// Future<void> initializeApp() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<FavoriteCubit>(
//           create: (context) => FavoriteCubit()..loadFavorites(),
//         ),
//         BlocProvider<CartCubit>(
//           create: (context) => CartCubit()..getCartItems(),
//         ),
//         BlocProvider<ProfileCubit>(
//           create: (context) => ProfileCubit()..getProfileData(),
//         ),
//       ],
//       child: BlocProvider(
//         create: (context) {
//           final cubit = AuthCubit();
//           cubit.authcheck();
//           return cubit;
//         },
//         child: Builder(
//           builder: (context) {
//             return BlocBuilder<AuthCubit, AuthState>(
//               bloc: BlocProvider.of<AuthCubit>(context),
//               buildWhen: (previous, current) => current is AuthInitial || current is AuthSuccess,
//               builder: (context, state) {
//                 return MaterialApp(
//                     title: 'Shopping App',
//                     theme: ThemeData(
//                       primarySwatch: Colors.blue,
//                     ),
//                    initialRoute:  state is AuthSuccess? AppRoutes.home : AppRoutes.signIn,
//                   onGenerateRoute: AppRouter.onGenerateRoute,

//                     );
//               },
//             );
//           }
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/firebase_options.dart';
import 'package:shopping/model/app_router.dart';
import 'package:shopping/model/app_routs.dart';
import 'package:shopping/view_block/auth_cubit/auth_cubit.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
import 'package:shopping/view_block/cart_cubit/cart_cubit.dart';
import 'package:shopping/view_block/profile_cubit/profile_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit()..loadFavorites(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit()..getCartItems(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit()..getProfileData(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) {
            final cubit = AuthCubit();
            cubit.authcheck();
            return cubit;
          },
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Shopping App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
            ),
            initialRoute:
                state is AuthSuccess ? AppRoutes.home : AppRoutes.signIn,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
