// class CategoryModel {
//   final String id;
//   final String name;
//   final String imageUrl;

//   CategoryModel({required this.id, required this.name, required this.imageUrl});
// }

// List<CategoryModel> dummyCategories = [
//   CategoryModel(
//       id: '1', name: 'Womens Clothing ', imageUrl: 'assets/shop/9.jpg'),
//   CategoryModel(id: '2', name: 'Men clothing ', imageUrl: 'assets/shop/8.jpg'),
//   CategoryModel(
//       id: '3', name: 'Children clothing', imageUrl: 'assets/shop/10.jpg'),
//   CategoryModel(id: '4', name: 'Bags', imageUrl: 'assets/shop/61.jpg'),
//   CategoryModel(id: '5', name: 'Perfumes', imageUrl: 'assets/shop/11.jpg'),
// ];
class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  // Convert CategoryModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  // Create a CategoryModel instance from a map
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
List<CategoryModel> dummyCategories = [
  CategoryModel(
      id: '1', name: 'Womens Clothing ', imageUrl: 'assets/shop/9.jpg'),
  CategoryModel(id: '2', name: 'Men clothing ', imageUrl: 'assets/shop/8.jpg'),
  CategoryModel(
      id: '3', name: 'Children clothing', imageUrl: 'assets/shop/10.jpg'),
  CategoryModel(id: '4', name: 'Bags', imageUrl: 'assets/shop/61.jpg'),
  CategoryModel(id: '5', name: 'Perfumes', imageUrl: 'assets/shop/11.jpg'),
];