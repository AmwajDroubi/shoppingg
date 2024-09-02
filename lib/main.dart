// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:shopping/model/cart_model.dart';
// import 'package:shopping/model/category_model.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/pages/satart.dart';
// import 'package:shopping/view_block/home_cubit/home_tab_cubit.dart';
// import 'package:shopping/widget/nav_bar.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//             create: (_) => CartModel(nam: "perfum", pric: 130)),
//         // Add other providers as needed
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: BlocProvider(
//         create: (context) => HomeTabCubit()..getHomeData(),
//         child: BottomNavBar(
//           orderProduct: dummyProduct,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/firebase_options.dart';
import 'package:shopping/pages/login.dart';
import 'package:shopping/view_block/auth_cubit/auth_cubit.dart';
import 'package:shopping/view_block/favorite_cubit/favorite_cubit.dart';
import 'package:shopping/view_block/cart_cubit/cart_cubit.dart';
import 'package:shopping/view_block/profile_cubit/profile_cubit.dart';
import 'package:shopping/widget/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await initializeApp();
  runApp(MyApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
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
      ],
      child: MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider(
            create: (context) => AuthCubit(),
            child: SignInPage(),
          )
          // BottomNavBar(orderProduct: []), // Provide initial data if needed
          ),
    );
  }
}
