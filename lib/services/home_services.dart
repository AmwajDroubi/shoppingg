import 'package:shopping/model/product_model.dart';
import 'package:shopping/services/firestore_services.dart';
import 'package:shopping/utils/api_path.dart';

class HomeServices {
  final firestoreServices = FirestoreServices.instance;

  Future<List<ProductModel>> getProducts() async {
    return await firestoreServices.getCollection<ProductModel>(
      path: ApiPath.products(),
      builder: (data, documentId) => ProductModel.fromMap(data, documentId),
    );
  }

  Future<void> setProduct(ProductModel productItem) async {
    await firestoreServices.setData(
      path: ApiPath.product(productItem.id),
      data: productItem.toMap(),
    );
  }
}
