import 'package:farmer_market/src/models/market.dart';
import 'package:farmer_market/src/services/firestore_service.dart';

class CustomerBloc {
  final db = FirestoreService();

  //Get
  Stream<List<Market>> get fetchUpcomingMarkets => db.fetchUpcomingMarkets();

  dispose(){

  }
}