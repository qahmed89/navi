import 'package:navi/model/placeorder/response_place_order_entity.dart';

responsePlaceOrderEntityFromJson(
    ResponsePlaceOrderEntity data, Map<String, dynamic> json) {
  if (json['Status'] != null) {
    data.status = json['Status'] is String
        ? int.tryParse(json['Status'])
        : json['Status'].toInt();
  }
  if (json['Result'] != null) {
    data.result = new ResponsePlaceOrderResult().fromJson(json['Result']);
  }
  return data;
}

Map<String, dynamic> responsePlaceOrderEntityToJson(
    ResponsePlaceOrderEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['Status'] = entity.status;
  if (entity.result != null) {
    data['Result'] = entity.result.toJson();
  }
  return data;
}

responsePlaceOrderResultFromJson(
    ResponsePlaceOrderResult data, Map<String, dynamic> json) {
  if (json['orderID'] != null) {
    data.orderID = json['orderID'] is String
        ? int.tryParse(json['orderID'])
        : json['orderID'].toInt();
  }
  return data;
}

Map<String, dynamic> responsePlaceOrderResultToJson(
    ResponsePlaceOrderResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['orderID'] = entity.orderID;
  return data;
}
