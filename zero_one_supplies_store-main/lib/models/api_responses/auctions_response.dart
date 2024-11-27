import 'package:ecomikstoreapp/models/api_responses/core_api_responses/paginated_data_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class AuctionsResponse {
  bool error;
  String msg;
  PaginatedDataResponse<AuctionShortItem> data;

  AuctionsResponse({this.error = false, this.msg = '', required this.data});

  factory AuctionsResponse.fromJson(Map<String, dynamic> json) {
    return AuctionsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: PaginatedDataResponse.getAPIResponseObjectSafeValue(
        json['data'],
        docFromJson: (data) =>
            AuctionShortItem.getAPIResponseObjectSafeValue(data),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'data': data.toJson((item) => item.toJson()),
      };

  factory AuctionsResponse.empty() =>
      AuctionsResponse(data: PaginatedDataResponse.empty());

  static AuctionsResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AuctionsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AuctionsResponse.empty();
}

// import 'product.dart';

class AuctionShortItem {
  String id;
  AuctionShortItemProduct product;
  DateTime startDate;
  DateTime endDate;
  double currentPrice;
  bool status;
  DateTime createdAt;
  bool isEnd;
  String bidNumber;

  AuctionShortItem({
    this.id = '',
    required this.product,
    required this.startDate,
    required this.endDate,
    this.currentPrice = 0,
    this.status = false,
    required this.createdAt,
    this.isEnd = false,
    this.bidNumber = '',
  });

  factory AuctionShortItem.fromJson(Map<String, dynamic> json) =>
      AuctionShortItem(
        id: APIHelper.getSafeStringValue(json['_id']),
        product: AuctionShortItemProduct.getAPIResponseObjectSafeValue(
            json['product']),
        startDate: APIHelper.getSafeDateTimeValue(json['start_date']),
        endDate: APIHelper.getSafeDateTimeValue(json['end_date']),
        currentPrice: APIHelper.getSafeDoubleValue(json['current_price']),
        status: APIHelper.getSafeBoolValue(json['status']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        isEnd: APIHelper.getSafeBoolValue(json['is_end']),
        bidNumber: APIHelper.getSafeStringValue(json['bid_number']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'product': product.toJson(),
        'start_date':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(startDate),
        'end_date':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(endDate),
        'current_price': currentPrice,
        'status': status,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(endDate),
        'is_end': isEnd,
        'bid_number': bidNumber,
      };
  factory AuctionShortItem.empty() => AuctionShortItem(
      product: AuctionShortItemProduct(),
      startDate: AppComponents.defaultUnsetDateTime,
      endDate: AppComponents.defaultUnsetDateTime,
      createdAt: AppComponents.defaultUnsetDateTime);

  static AuctionShortItem getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AuctionShortItem.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AuctionShortItem.empty();
}

class AuctionShortItemProduct {
  String id;
  String name;
  String image;

  AuctionShortItemProduct({this.id = '', this.name = '', this.image = ''});

  factory AuctionShortItemProduct.fromJson(Map<String, dynamic> json) {
    return AuctionShortItemProduct(
      id: APIHelper.getSafeStringValue(json['_id']),
      name: APIHelper.getSafeStringValue(json['name']),
      image: APIHelper.getSafeStringValue(json['image']),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'image': image,
      };
  static AuctionShortItemProduct getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AuctionShortItemProduct.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AuctionShortItemProduct();
}
