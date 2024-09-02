// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping/pages/home.dart';
// import 'package:shopping/view_block/auth_cubit/auth_cubit.dart';
// import 'package:shopping/widget/main_button.dart';
// import 'package:shopping/widget/nav_bar.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
//   // void dispose() {
//   //   super.dispose();

//   // }
// }

// class _SignUpPageState extends State<SignUpPage> {
//   bool isSecured = true;
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confairmpasswordController = TextEditingController();

//   Future signUp() async {
//     if (paswordConfirmd()) {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());
//       Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => BottomNavBar(
//                 orderProduct: [],
//               )));
//     }
//   }

//   bool paswordConfirmd() {
//     if (passwordController.text.trim() ==
//         confairmpasswordController.text.trim()) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authCubit = BlocProvider.of<AuthCubit>(context);

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 50),
//                   Text(
//                     'Sign up',
//                     style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     'Please, login with registered account!',
//                     style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                           color: Colors.grey,
//                         ),
//                   ),
//                   const SizedBox(height: 36),
//                   Text(
//                     'Email',
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const SizedBox(height: 12),
//                   TextFormField(
//                     controller: emailController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Email is required';
//                       } else if (!value.contains('@')) {
//                         return 'Email is invalid';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'Enter your email',
//                       hintStyle:
//                           Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                 color: Colors.grey,
//                               ),
//                       prefixIcon: const Icon(Icons.email),
//                       prefixIconColor: Colors.grey[400],
//                     ),
//                   ),
//                   const SizedBox(height: 36),
//                   Text(
//                     'Password',
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const SizedBox(height: 12),
//                   TextFormField(
//                     controller: passwordController,
//                     validator: (value) =>
//                         value!.isNotEmpty ? null : 'Password is required',
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your password',
//                       hintStyle:
//                           Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                 color: Colors.grey,
//                               ),
//                       prefixIcon: const Icon(Icons.lock),
//                       prefixIconColor: Colors.grey[400],
//                       suffixIconColor: Colors.grey[400],
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           isSecured ? Icons.visibility : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             isSecured = !isSecured;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 36),
//                   Text(
//                     ' Confairm password',
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const SizedBox(height: 12),
//                   TextFormField(
//                     controller: confairmpasswordController,
//                     validator: (value) =>
//                         value!.isNotEmpty ? null : 'Password is required',
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your password',
//                       hintStyle:
//                           Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                 color: Colors.grey,
//                               ),
//                       prefixIcon: const Icon(Icons.lock),
//                       prefixIconColor: Colors.grey[400],
//                       suffixIconColor: Colors.grey[400],
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           isSecured ? Icons.visibility : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             isSecured = !isSecured;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Forgot Password?',
//                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                               color: Colors.blue[800],
//                             ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   BlocConsumer<AuthCubit, AuthState>(
//                     bloc: authCubit,
//                     listenWhen: (previous, current) =>
//                         current is AuthSuccess || current is AuthFailed,
//                     listener: (context, state) {
//                       if (state is AuthSuccess) {
//                         // Navigator.pushNamed(context, AppRoutes.home);
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => HomePage(
//                                   addFavorite: (ProductModel) {},
//                                   removeFavorite: (ProductModel) {},
//                                   orderProduct: [],
//                                 )));
//                       } else if (state is AuthFailed) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(state.message),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       }
//                     },
//                     buildWhen: (previous, current) =>
//                         current is AuthLoading ||
//                         current is AuthFailed ||
//                         current is AuthSuccess,
//                     builder: (context, state) {
//                       if (state is AuthLoading) {
//                         return const MainButton(
//                           isLoading: true,
//                         );
//                       }
//                       return MainButton(
//                         label: 'SignUp',
//                         onPressed: () async {
//                           if (formKey.currentState!.validate()) {
//                             await authCubit.signIn(
//                               emailController.text,
//                               passwordController.text,
//                             );
//                           }
//                         },
//                       );
//                     },
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(onPressed: () {}, child: Text("Login")))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/view_block/signup/signup_cubit.dart';
import 'package:shopping/view_block/signup/signup_state.dart';
import 'package:shopping/widget/nav_bar.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: SignUpForm(),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Email is required' : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Password is required' : null,
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) => value != passwordController.text
                    ? 'Passwords do not match'
                    : null,
              ),
              SizedBox(height: 20),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else if (state is SignUpFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        signUpCubit.signUp(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              BottomNavBar(orderProduct: [])));
                    },
                    child: Text('Sign Up'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
