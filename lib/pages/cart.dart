// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:shopping/model/cart_model.dart';
// import 'package:shopping/model/product_model.dart';
// import 'package:shopping/pages/counter.dart';
// import 'package:shopping/pages/pay.dart';
// import 'package:shopping/pages/t.dart';
// import 'package:shopping/view_block/cart_cubit/cart_cubit.dart';
// import 'package:shopping/view_block/cart_cubit/cart_state.dart';

// class CartP extends StatefulWidget {
//   final List<ProductModel> orderProduct;

//   const CartP({Key? key, required this.orderProduct}) : super(key: key);

//   @override
//   State<CartP> createState() => _CartPState();
// }

// class _CartPState extends State<CartP> {
//   @override
//   Widget build(BuildContext context) {
//     final cartCubit = BlocProvider.of<CartCubit>(context);

//     return BlocBuilder(
//         bloc: cartCubit,
//         buildWhen: (previous, current) =>
//             current is CartLoaded ||
//             current is CartError ||
//             current is CartLoading,
//         builder: (context, state) {
//           if (state is CartLoading) {
//             return const Center(
//               child: CircularProgressIndicator.adaptive(),
//             );
//           } else if (state is CartLoaded) {
//             final cartItems = state.cartOrders;
//             final subtotal = state.subtotal;
//             final shipping = state.shipping;
//             final totalPrice = state.totalPrice;

//             return RefreshIndicator(
//                 onRefresh: () async {
//                   cartCubit.getCartItems();
//                 },
//                 child: Scaffold(
//                   appBar: AppBar(
//                     title: Text(
//                       'Cart',
//                       style: TextStyle(
//                         fontSize: 35,
//                         color: Colors.grey[800],
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "EduTASBeginner",
//                       ),
//                     ),
//                     centerTitle: true,
//                   ),
//                   body: Consumer<CartModel>(
//                     builder: (context, cart, child) {
//                       return Column(
//                         children: [
//                           Expanded(
//                             child: ListView.builder(
//                               itemCount: cart.items.length,
//                               itemBuilder: (context, index) {
//                                 final product = cart.items[index];
//                                 return ListTile(
//                                   leading: Image.asset(
//                                     product.imageUrl,
//                                     height: 150,
//                                     width: 80,
//                                     fit: BoxFit.fill,
//                                   ),
//                                   title: Text(
//                                     product.name,
//                                     style: TextStyle(fontSize: 26),
//                                   ),
//                                   subtitle: Row(
//                                     children: [
//                                       Text(
//                                         '${product.price}',
//                                         style: TextStyle(fontSize: 22),
//                                       ),
//                                       SizedBox(
//                                         width: 22,
//                                       ),
//                                       Container(
//                                         color: Colors.grey[100],
//                                         child: CounterWidget(
//                                           product: product,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   trailing: IconButton(
//                                     icon: Icon(Icons.delete),
//                                     onPressed: () {
//                                       cart.remove(product);
//                                     },
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(11.0),
//                             child: AnimatedButton(
//                               text: 'Confairm',
//                               color: Colors.purple,
//                               pressEvent: () {
//                                 AwesomeDialog(
//                                   context: context,
//                                   keyboardAware: true,
//                                   dismissOnBackKeyPress: false,
//                                   dialogType: DialogType.warning,
//                                   animType: AnimType.bottomSlide,
//                                   btnCancelText: "Cancel Order",
//                                   btnOkText: "Yes, I will pay",
//                                   title: 'Continue to pay?',
//                                   btnCancelOnPress: () {},
//                                   btnOkOnPress: () {
//                                     List<ProductModel> orderProduct =
//                                         cart.items.toList();
//                                     showModalBottomSheet(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           List<ProductModel> orderProduct =
//                                               cart.items.toList();

//                                           return PayP(
//                                               orderProduct: orderProduct);
//                                         });
//                                   },
//                                 ).show();
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ));
//           } else if (state is CartError) {
//             return Center(child: Text("Error Page"));
//           } else {
//             return Container(
//               color: Colors.black,
//             );
//           }
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/view_block/cart_cubit/cart_cubit.dart';
import 'package:shopping/view_block/cart_cubit/cart_state.dart';
import 'package:shopping/view_block/product_details_cubit/product_details_cubit.dart';
import 'package:shopping/widget/cart_order_item.dart';
import 'package:shopping/widget/label_with_value.dart';
import 'package:shopping/widget/main_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return BlocBuilder(
      bloc: cartCubit,
      buildWhen: (previous, current) =>
          current is CartLoaded ||
          current is CartError ||
          current is CartLoading,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartLoaded) {
          final cartItems = state.cartOrders;
          final subtotal = state.subtotal;
          final shipping = state.shipping;
          final totalPrice = state.totalPrice;

          return RefreshIndicator(
            onRefresh: () async {
              cartCubit.getCartItems();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ListView.separated(
                    itemCount: cartItems.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(
                        color: Colors.grey[200],
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return CartOrderItem(cartItem: cartItems[index]);
                    },
                  ),
                  const SizedBox(height: 36),
                  LabelWithValueRow(
                    label: 'Subtotal',
                    value: '\$$subtotal',
                  ),
                  const SizedBox(height: 8),
                  LabelWithValueRow(
                    label: 'Shipping',
                    value: '\$$shipping',
                  ),
                  const SizedBox(height: 8),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 8),
                  LabelWithValueRow(
                    label: 'Total',
                    value: '\$$totalPrice',
                  ),
                  const SizedBox(height: 36),
                  MainButton(
                    label: 'Checkout',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

         