import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_market/src/models/market.dart';
import 'package:farmer_market/src/models/product.dart';
import 'package:farmer_market/src/models/user.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> addUser(Farmer user) {
    return _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<Farmer> fetchUser(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => Farmer.fromFireStore(snapshot.data()));
  }

  Stream<List<String>> fetchUnitTypes() {
    return _db.collection('types').doc('units').snapshots().map((snapshot) =>
        snapshot
            .data()['production']
            .map<String>((type) => type.toString())
            .toList());
  }

  Future setProduct(Product product) {
    return _db
        .collection('products')
        .doc(product.productId)
        .set(product.toMap());
  }

  Future<Product> fetchProduct(String productId) {
    return _db
        .collection('products')
        .doc(productId)
        .get()
        .then((snapshot) => Product.fromFirestore(snapshot.data()));
  }

  Stream<List<Product>> fetchProductsByVedorId(String vendorId) {
    return _db
        .collection('products')
        .where('vendorId', isEqualTo: vendorId)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) =>
            snapshot.map((doc) => Product.fromFirestore(doc.data())).toList());
  }
  Stream<List<Market>> fetchUpcomingMarkets(){
    return _db
        .collection('markets')
        .where('dateEnd', isGreaterThan: DateTime.now().toIso8601String())
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) => snapshot
        .map((docs) => Market.fromFirestore(docs.data()))
        .toList());
  }
}
