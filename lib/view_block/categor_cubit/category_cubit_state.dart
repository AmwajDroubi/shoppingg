import 'package:shopping/model/category_model.dart';
import 'package:shopping/model/product_model.dart';

abstract class CategoryState {
  const CategoryState();
}

// class CategoryInitial extends CategoryState {
//   final List<CategoryModel> categories;
//   final List<ProductModel> products;
//   final List<ProductModel> filteredProducts;
//   final String? selectedCategoryId;

//   CategoryInitial({
//     required this.categories,
//     required this.products,
//     required this.filteredProducts,
//     this.selectedCategoryId,
//   });
//}

// class CategoryUpdated extends CategoryState {
//   final List<ProductModel> filteredProducts;
//   final String? selectedCategoryId;

//   CategoryUpdated({
//     required this.filteredProducts,
//     this.selectedCategoryId,
//   });
// }

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryError extends CategoryState {
  final String masg;

  CategoryError({required this.masg});
}
