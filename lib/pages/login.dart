import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/pages/forgetpass.dart';
import 'package:shopping/pages/home.dart';
import 'package:shopping/pages/signup.dart';
import 'package:shopping/view_block/auth_cubit/auth_cubit.dart';
import 'package:shopping/widget/main_button.dart';
import 'package:shopping/widget/nav_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isSecured = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Login Account',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Please, login with registered account!',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/shop/welcom1.jpg")),
                  SizedBox(
                    height: 20,
                  ),
                  //    const SizedBox(height: 36),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 9),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!value.contains('@')) {
                        return 'Email is invalid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 9),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) =>
                        value!.isNotEmpty ? null : 'Password is required',
                    obscureText: isSecured,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      prefixIcon: const Icon(Icons.lock),
                      prefixIconColor: Colors.grey[400],
                      suffixIconColor: Colors.grey[400],
                      suffixIcon: IconButton(
                        icon: Icon(
                          isSecured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isSecured = !isSecured;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgetPass()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.blue[800],
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  BlocConsumer<AuthCubit, AuthState>(
                    bloc: authCubit,
                    listenWhen: (previous, current) =>
                        current is AuthSuccess || current is AuthFailed,
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        // Navigator.pushNamed(context, AppRoutes.home);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNavBar(
                                  orderProduct: [],
                                )));
                      } else if (state is AuthFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is AuthLoading ||
                        current is AuthFailed ||
                        current is AuthSuccess,
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const MainButton(
                          isLoading: true,
                        );
                      }
                      return MainButton(
                        label: 'Login',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await authCubit.signIn(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Text("If you dont have account, Please"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (context) => AuthCubit(),
                                      child: SignUpPage(),
                                    )));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  // Align(
                  //     alignment: Alignment.centerRight,
                  //     child: TextButton(
                  //         onPressed: () {
                  //           Navigator.of(context).push(MaterialPageRoute(
                  //               builder: (context) => BlocProvider(
                  //                     create: (context) => AuthCubit(),
                  //                     child: SignUpPage(),
                  //                   )));
                  //         },
                  //         child: Row(
                  //           children: [
                  //             Text("If you dont have account, Please "),
                  //             Text(
                  //               "SignUp",
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 22),
                  //             ),
                  //           ],
                  //         )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
