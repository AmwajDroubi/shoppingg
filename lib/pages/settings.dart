// import 'package:flutter/material.dart';
// import 'package:shopping/model/setting_model.dart';

// class SettingP extends StatelessWidget {
//   const SettingP({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.grey[300],
//           title: const Text(
//             "Settings",
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//             child: Container(
//           color: Colors.grey[300],
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 "General",
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(children: [
//                   SizedBox(
//                     height: 380,
//                     child: ListView.builder(
//                         itemCount: listProfile.length,
//                         itemBuilder: (_, index) {
//                           final setng = listProfile[index];
//                           return InkWell(
//                               onTap: () {
//                                 setng.onTap(context);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   color: Colors.grey[100],
//                                   height: 64,
//                                   child: ListTile(
//                                     leading: Icon(
//                                       setng.icon1,
//                                       size: 35,
//                                     ),
//                                     title: Text(
//                                       setng.t,
//                                       style: const TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     trailing: Icon(
//                                       setng.icon2,
//                                       size: 30,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                               ));
//                         }),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Preferencess",
//                             style: TextStyle(
//                                 fontSize: 26, fontWeight: FontWeight.w700),
//                           ),
//                         ]),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Container(
//                             color: Colors.grey[100],
//                             height: 64,
//                             child: const ListTile(
//                               leading: Icon(
//                                 Icons.policy_outlined,
//                                 size: 35,
//                               ),
//                               title: Text(
//                                 "Legal and Policies",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.w600),
//                               ),
//                               trailing: Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: 30,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 19,
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: Container(
//                             color: Colors.grey[100],
//                             height: 64,
//                             child: const ListTile(
//                               leading: Icon(
//                                 Icons.logout,
//                                 size: 35,
//                               ),
//                               title: Text(
//                                 "Logout",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.w600),
//                               ),
//                               trailing: Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: 30,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 19,
//                         ),
//                       ],
//                     ),
//                   )
//                 ])),
//           ]),
//         )));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/app_routs.dart';
import 'package:shopping/model/setting_model.dart';
import 'package:shopping/view_block/auth_cubit/auth_cubit.dart';
import 'package:shopping/view_block/profile_cubit/profile_cubit.dart';
import 'package:shopping/widget/main_button.dart';

class SettingP extends StatelessWidget {
  const SettingP({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
        bloc: profileCubit,
        buildWhen: (previous, current) =>
            current is ProfileLoaded ||
            current is ProfileLoading ||
            current is ProfileError,
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.grey[300],
                  title: const Text(
                    "Settings",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                    child: Container(
                  color: Colors.grey[300],
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "General",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              SizedBox(
                                height: 380,
                                child: ListView.builder(
                                    itemCount: listProfile.length,
                                    itemBuilder: (_, index) {
                                      final setng = listProfile[index];
                                      return InkWell(
                                          onTap: () {
                                            setng.onTap(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              color: Colors.grey[100],
                                              height: 64,
                                              child: ListTile(
                                                leading: Icon(
                                                  setng.icon1,
                                                  size: 35,
                                                ),
                                                title: Text(
                                                  setng.t,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                trailing: Icon(
                                                  setng.icon2,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ));
                                    }),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Preferencess",
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        color: Colors.grey[100],
                                        height: 64,
                                        child: const ListTile(
                                          leading: Icon(
                                            Icons.policy_outlined,
                                            size: 35,
                                          ),
                                          title: Text(
                                            "Legal and Policies",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 19,
                                    ),
                                    BlocConsumer<AuthCubit, AuthState>(
                                      bloc: authCubit,
                                      listenWhen: (previous, current) =>
                                          current is SignedOut ||
                                          current is AuthFailed,
                                      listener: (context, state) {
                                        if (state is AuthFailed) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text(state.message)));
                                        } else if (state is SignedOut) {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  AppRoutes.signIn);
                                        }
                                      },
                                      buildWhen: (previous, current) =>
                                          current is SigningOut ||
                                          current is SignedOut ||
                                          current is AuthFailed,
                                      builder: (context, state) {
                                        if (state is SigningOut) {
                                          return MainButton(
                                            isLoading: true,
                                          );
                                        }

                                        return InkWell(
                                          onTap: () async =>
                                              await authCubit.signOut(),
                                          child: Container(
                                            color: Colors.grey[100],
                                            height: 64,
                                            child: const ListTile(
                                              leading: Icon(
                                                Icons.logout,
                                                size: 35,
                                              ),
                                              title: Text(
                                                "Logout",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 19,
                                    ),
                                  ],
                                ),
                              )
                            ])),
                      ]),
                )));
          } else if (state is ProfileError) {
            return Center(child: Text("Error Page"));
          } else {
            return Container(
              color: Colors.black,
            );
          }
        });
  }
}
