import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class DashBoardResponse {
  bool error;
  String msg;
  DashBoardShortItem data;

  DashBoardResponse({this.error = false, this.msg = '', required this.data});

  factory DashBoardResponse.fromJson(Map<String, dynamic> json) {
    return DashBoardResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: DashBoardShortItem.getAPIResponseObjectSafeValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory DashBoardResponse.empty() =>
      DashBoardResponse(data: DashBoardShortItem.empty());

  static DashBoardResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? DashBoardResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : DashBoardResponse.empty();
}

class DashBoardShortItem {
  String id;
  String name;
  StoreDashBoardEarningSell earningSell;
  DashBoardTotalProducts totalProducts;
  List<EarningGraphDatum> earningGraphData;

  DashBoardShortItem({
    this.id = '',
    this.name = '',
    required this.earningSell,
    required this.totalProducts,
    this.earningGraphData = const [],
  });

  factory DashBoardShortItem.fromJson(Map<String, dynamic> json) =>
      DashBoardShortItem(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        earningSell: StoreDashBoardEarningSell.getAPIResponseObjectSafeValue(
            json['earning_sell']),
        totalProducts: DashBoardTotalProducts.getAPIResponseObjectSafeValue(
            json['total_products']),
        earningGraphData: APIHelper.getSafeListValue(json['earning_graph_data'])
            .map((e) => EarningGraphDatum.getAPIResponseObjectSafeValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'earning_sell': earningSell.toJson(),
        'total_products': totalProducts.toJson(),
        'earning_graph_data': earningGraphData.map((e) => e.toJson()).toList(),
      };

  factory DashBoardShortItem.empty() => DashBoardShortItem(
        earningSell: StoreDashBoardEarningSell.empty(),
        totalProducts: DashBoardTotalProducts(),
      );

  static DashBoardShortItem getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? DashBoardShortItem.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : DashBoardShortItem.empty();
}

class EarningGraphDatum {
  String id;
  double amount;
  DateTime createdAt;

  EarningGraphDatum({this.id = '', this.amount = 0, required this.createdAt});

  factory EarningGraphDatum.fromJson(Map<String, dynamic> json) {
    return EarningGraphDatum(
      id: APIHelper.getSafeStringValue(json['_id']),
      amount: APIHelper.getSafeDoubleValue(json['amount']),
      createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'amount': amount,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
      };

  factory EarningGraphDatum.empty() =>
      EarningGraphDatum(createdAt: AppComponents.defaultUnsetDateTime);

  static EarningGraphDatum getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? EarningGraphDatum.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : EarningGraphDatum.empty();
}

class StoreDashBoardEarningSell {
  DashBoardStoreId id;
  double totalEarning;
  int totalProductSell;

  StoreDashBoardEarningSell(
      {required this.id, this.totalEarning = 0, this.totalProductSell = 0});

  factory StoreDashBoardEarningSell.fromJson(Map<String, dynamic> json) =>
      StoreDashBoardEarningSell(
        id: DashBoardStoreId.getAPIResponseObjectSafeValue(json['_id']),
        totalEarning: APIHelper.getSafeDoubleValue(json['total_earning'], 0),
        totalProductSell:
            APIHelper.getSafeIntValue(json['total_product_sell'], 0),
      );

  Map<String, dynamic> toJson() => {
        '_id': id.toJson(),
        'total_earning': totalEarning,
        'total_product_sell': totalProductSell,
      };

  factory StoreDashBoardEarningSell.empty() =>
      StoreDashBoardEarningSell(id: DashBoardStoreId());

  static StoreDashBoardEarningSell getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? StoreDashBoardEarningSell.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : StoreDashBoardEarningSell.empty();
}

class DashBoardStoreId {
  String store;

  DashBoardStoreId({this.store = ''});

  factory DashBoardStoreId.fromJson(Map<String, dynamic> json) =>
      DashBoardStoreId(
        store: APIHelper.getSafeStringValue(json['store']),
      );

  Map<String, dynamic> toJson() => {
        'store': store,
      };

  static DashBoardStoreId getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? DashBoardStoreId.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : DashBoardStoreId();
}

class DashBoardTotalProducts {
  String id;
  int totalProducts;

  DashBoardTotalProducts({this.id = '', this.totalProducts = 0});

  factory DashBoardTotalProducts.fromJson(Map<String, dynamic> json) =>
      DashBoardTotalProducts(
        id: APIHelper.getSafeStringValue(json['_id']),
        totalProducts: APIHelper.getSafeIntValue(json['total_products'], 0),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'total_products': totalProducts,
      };

  static DashBoardTotalProducts getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? DashBoardTotalProducts.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : DashBoardTotalProducts();
}
