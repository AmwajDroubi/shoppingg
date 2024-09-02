// import 'package:flutter/material.dart';
// import 'package:shopping/model/product_model.dart';

// class PayP extends StatefulWidget {
//   final List<ProductModel> orderProduct;

//   const PayP({super.key, required this.orderProduct});

//   @override
//   State<PayP> createState() => _PayPState();
// }

// class _PayPState extends State<PayP> {
//   List<ProductModel> orderProduct = [];

//   @override
//   void initState() {
//     super.initState();
//     orderProduct = widget.orderProduct;
//   }

//   double get subtotal {
//     return orderProduct.fold(
//         0, (sum, product) => sum + product.price.toDouble());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           const SizedBox(
//             height: 10,
//           ),
//           ListView.builder(
//               itemCount: widget.orderProduct.length,
//               itemBuilder: (_, index) {
//                 final product = widget.orderProduct[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(15)),
//                     height: 80,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(9.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Expanded(
//                                 child: Center(
//                                   child: Text(
//                                     "${product.price}",
//                                     style: const TextStyle(
//                                         fontSize: 28, color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               Image.asset(
//                                 product.imageUrl,
//                                 height: 62,
//                                 width: 75, fit: BoxFit.fill,
//                                 // style: const TextStyle(
//                                 //     fontSize: 28, color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//           const Spacer(),
//           Container(
//             height: 170,
//             color: Colors.blue[200],
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "${subtotal} ",
//                         style: TextStyle(fontSize: 30, color: Colors.white),
//                       ),
//                     ),
//                     Text(
//                       "السعر الكلي",
//                       style: TextStyle(fontSize: 30, color: Colors.white),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Text(
//                       "${subtotal + 7} ",
//                       style: TextStyle(fontSize: 30, color: Colors.white),
//                     )),
//                     Text(
//                       "السعر بعد الضريبة",
//                       style: TextStyle(fontSize: 30, color: Colors.white),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shopping/model/product_model.dart';

class PayP extends StatefulWidget {
  final List<ProductModel> orderProduct;

  const PayP({Key? key, required this.orderProduct}) : super(key: key);

  @override
  State<PayP> createState() => _PayPState();
}

class _PayPState extends State<PayP> {
  late List<ProductModel> orderProduct; // Use late initialization

  @override
  void initState() {
    super.initState();
    orderProduct = widget.orderProduct;
  }

  double get subtotal {
    return orderProduct.fold(
        0, (sum, product) => sum + product.price.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          SingleChildScrollView(
            child: Container(
              height: 200, // Adjust height as needed
              child: ListView.builder(
                itemCount: widget.orderProduct.length,
                itemBuilder: (_, index) {
                  final product = widget.orderProduct[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "${product.price}",
                                style: TextStyle(
                                    fontSize: 28, color: Colors.black),
                              ),
                            ),
                          ),
                          Image.asset(
                            product.imageUrl,
                            height: 62,
                            width: 75,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Spacer(),
          Container(
            // height: 180,
            color: Colors.blue[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${subtotal.toStringAsFixed(2)} ",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      "السعر الكلي",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${(subtotal + 7).toStringAsFixed(2)} ",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      "السعر بعد الضريبة",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text(" الدفع"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
