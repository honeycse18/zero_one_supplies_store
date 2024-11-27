import 'package:ecomikstoreapp/models/api_responses/auctions_response.dart';

class AddAuction2ndScreenParameter {
  final AuctionShortItem? auction;
  final String productID;
  AddAuction2ndScreenParameter({
    this.auction,
    required this.productID,
  });
}
