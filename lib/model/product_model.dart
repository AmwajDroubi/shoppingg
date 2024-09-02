
import 'package:shopping/model/category_model.dart';




enum ProductSize { S, M, L, XL, XXL }

extension ProductSizeExtension on ProductSize {
  // Converts a string to a ProductSize enum value
  static ProductSize fromString(String size) {
    switch (size) {
      case 'S':
        return ProductSize.S;
      case 'M':
        return ProductSize.M;
      case 'L':
        return ProductSize.L;
      case 'XL':
        return ProductSize.XL;
      case 'XXL':
        return ProductSize.XXL;
      default:
        throw ArgumentError('Invalid size: $size');
    }
  }

  // Get the string representation of the enum
  String get name {
    switch (this) {
      case ProductSize.S:
        return 'S';
      case ProductSize.M:
        return 'M';
      case ProductSize.L:
        return 'L';
      case ProductSize.XL:
        return 'XL';
      case ProductSize.XXL:
        return 'XXL';
    }
  }
}


class ProductModel {
  final String id;
  final String name;
  final String descreption; // Typo here should be `description`
  bool order;
  int counter;
  bool isFavorite;
  final String imageUrl;
  final double price;
  final CategoryModel category;

  ProductModel({
    required this.id,
    required this.name,
    this.descreption =
        "Customers described it as very delicious. I advise you to buy it",
    this.order = false,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.counter = 1,
    this.isFavorite = false,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? descreption,
    bool? order,
    String? imageUrl,
    double? price,
    CategoryModel? category,
    int? counter,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      descreption: descreption ?? this.descreption,
      order: order ?? this.order,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      counter: counter ?? this.counter,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'descreption': descreption});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'price': price});
    result.addAll({'category': category.toMap()}); // Assuming `CategoryModel` has `toMap` method
    result.addAll({'counter': counter});
    result.addAll({'isFavorite': isFavorite});
    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      descreption: map['descreption'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      category: CategoryModel.fromMap(map['category'] ?? {}), // Assuming `CategoryModel` has `fromMap` method
      counter: map['counter'] ?? 1,
      isFavorite: map['isFavorite'] ?? false,
    );
  }
}

List<ProductModel> dummyProduct = [
  ProductModel(
    id: "1",
    category: dummyCategories[0],
    name: '  ملابس نسائية',
    imageUrl: 'assets/shop/55.jpg',
    price: 100,
  ),
  ProductModel(
    id: "2",
    category: dummyCategories[2],
    name: 'ملابس ولادية',
    imageUrl: 'assets/shop/21.jpg',
    price: 60,
  ),
  ProductModel(
    id: "3",
    category: dummyCategories[1],
    name: '  ملابس رجالية',
    imageUrl: 'assets/shop/44.jpg',
    price: 60,
  ),
  ProductModel(
    id: "4",
    category: dummyCategories[0],
    name: '  ملابس نسائية',
    imageUrl: 'assets/shop/53.jpg',
    price: 120,
  ),
  ProductModel(
    id: "5",
    category: dummyCategories[4],
    name: ' عطور رجالية',
    imageUrl: 'assets/shop/12.jpg',
    price: 190,
  ),
  ProductModel(
    id: "6",
    category: dummyCategories[4],
    name: ' عطور نسائية',
    imageUrl: 'assets/shop/13.jpg',
    price: 130,
  ),
  ProductModel(
    id: "7",
    category: dummyCategories[2],
    name: ' ملابس بناتية',
    imageUrl: 'assets/shop/23.jpg',
    price: 40,
  ),
  ProductModel(
    id: "8",
    category: dummyCategories[2],
    name: ' ملابس ولادية',
    imageUrl: 'assets/shop/20.jpg',
    price: 40,
  ),
  ProductModel(
    id: "9",
    category: dummyCategories[1],
    name: '  ملابس رجالية',
    imageUrl: 'assets/shop/45.jpg',
    price: 80,
  ),
  ProductModel(
    id: "10",
    category: dummyCategories[0],
    name: '  ملابس نسائية',
    imageUrl: 'assets/shop/50.jpg',
    price: 80,
  ),
  ProductModel(
    id: "11",
    category: dummyCategories[3],
    name: ' حقائب نسائية',
    imageUrl: 'assets/shop/32.jpg',
    price: 140,
  ),
  ProductModel(
    id: "12",
    category: dummyCategories[3],
    name: ' حقائب رجالية',
    imageUrl: 'assets/shop/34.jpg',
    price: 70,
  ),
  ProductModel(
    id: "13",
    category: dummyCategories[1],
    name: '  ملابس رجالية',
    imageUrl: 'assets/shop/43.jpg',
    price: 80,
  ),
  ProductModel(
    id: "14",
    category: dummyCategories[0],
    name: '  ملابس نسائية',
    imageUrl: 'assets/shop/51.jpg',
    price: 150,
  ),
  ProductModel(
    id: "15",
    category: dummyCategories[4],
    name: 'عطور نسائية',
    imageUrl: 'assets/shop/14.jpg',
    price: 150,
  ),
  ProductModel(
    id: "16",
    category: dummyCategories[3],
    name: ' حقائب رجالية',
    imageUrl: 'assets/shop/35.jpg',
    price: 70,
  ),
  ProductModel(
    id: "17",
    category: dummyCategories[1],
    name: '  ملابس رجالية',
    imageUrl: 'assets/shop/40.jpg',
    price: 60,
  ),
  ProductModel(
    id: "18",
    category: dummyCategories[4],
    name: ' عطور نسائية',
    imageUrl: 'assets/shop/15.jpg',
    price: 160,
  ),
  ProductModel(
    id: "19",
    category: dummyCategories[2],
    name: 'ملابس بناتية ',
    imageUrl: 'assets/shop/22.jpg',
    price: 35,
  ),
  ProductModel(
    id: "20",
    category: dummyCategories[2],
    name: ' ملابس بناتية',
    imageUrl: 'assets/shop/24.jpg',
    price: 30,
  ),
  ProductModel(
    id: "21",
    category: dummyCategories[2],
    name: ' ملابس ولادية',
    imageUrl: 'assets/shop/25.jpg',
    price: 60,
  ),
  ProductModel(
    id: "22",
    category: dummyCategories[4],
    name: 'عطور رجالية',
    imageUrl: 'assets/shop/17.jpg',
    price: 180,
  ),
  ProductModel(
    id: "23",
    category: dummyCategories[3],
    name: ' حقائب نسائية',
    imageUrl: 'assets/shop/30.jpg',
    price: 40,
  ),
  ProductModel(
    id: "24",
    category: dummyCategories[1],
    name: '  ملابس رجالية',
    imageUrl: 'assets/shop/42.jpg',
    price: 30,
  ),
  ProductModel(
    id: "25",
    category: dummyCategories[0],
    name: '  ملابس نسائية',
    imageUrl: 'assets/shop/52.jpg',
    price: 120,
  ),
  ProductModel(
    id: "26",
    category: dummyCategories[4],
    name: 'عطور نسائية',
    imageUrl: 'assets/shop/16.jpg',
    price: 100,
  ),
  ProductModel(
    id: "27",
    category: dummyCategories[1],
    name: '  ملابس رجالية',
    imageUrl: 'assets/shop/41.jpg',
    price: 30,
  ),
  ProductModel(
    id: "28",
    category: dummyCategories[0],
    name: '  ملابس نسائية',
    imageUrl: 'assets/shop/54.jpg',
    price: 100,
  ),
  ProductModel(
    id: "29",
    category: dummyCategories[0],
    name: '  ملابس نسائية',
    imageUrl: 'assets/shop/56.jpg',
    price: 180,
  ),
  ProductModel(
    id: "30",
    category: dummyCategories[3],
    name: ' حقائب نسائية',
    imageUrl: 'assets/shop/31.jpg',
    price: 80,
  ),
  ProductModel(
    id: "31",
    category: dummyCategories[3],
    name: ' حقائب نسائية',
    imageUrl: 'assets/shop/33.jpg',
    price: 60,
  ),
];