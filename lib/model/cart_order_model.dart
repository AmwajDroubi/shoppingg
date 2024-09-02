import 'package:shopping/model/product_model.dart';

class CartOrdersModel {
  final String id;
  final ProductModel product;
  final double totalPrice;
  final int quantity;
  final ProductSize size;

  CartOrdersModel({
    required this.id,
    required this.product,
    required this.totalPrice,
    required this.quantity,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'product': product.toMap()});
    result.addAll({'totalPrice': totalPrice});
    result.addAll({'quantity': quantity});
    result.addAll({'size': size.name});
  
    return result;
  }

 factory CartOrdersModel.fromMap(Map<String, dynamic> map) {
    return CartOrdersModel(
      id: map['id'] ?? '',
      product: ProductModel.fromMap(map['product'] ?? {}),
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 1,
      size: ProductSizeExtension.fromString(map['size'] ?? ''), // Make sure 'size' is a valid string
    );
  }

  CartOrdersModel copyWith({
    String? id,
    ProductModel? product,
    double? totalPrice,
    int? quantity,
    ProductSize? size,
  }) {
    return CartOrdersModel(
      id: id ?? this.id,
      product: product ?? this.product,
      totalPrice: totalPrice ?? this.totalPrice,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }
}

List<CartOrdersModel> dummyCartOrders = [];