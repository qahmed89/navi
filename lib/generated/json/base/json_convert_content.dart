// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

import 'package:navi/generated/json/response_place_order_entity_helper.dart';
import 'package:navi/generated/json/response_vehicles_entity_helper.dart';
// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:navi/model/placeorder/response_place_order_entity.dart';
import 'package:navi/model/vehicles/response_vehicles_entity.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case ResponsePlaceOrderEntity:
        return responsePlaceOrderEntityFromJson(
            data as ResponsePlaceOrderEntity, json) as T;
      case ResponsePlaceOrderResult:
        return responsePlaceOrderResultFromJson(
            data as ResponsePlaceOrderResult, json) as T;
      case ResponseVehiclesEntity:
        return responseVehiclesEntityFromJson(
            data as ResponseVehiclesEntity, json) as T;
      case ResponseVehiclesResult:
        return responseVehiclesResultFromJson(
            data as ResponseVehiclesResult, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case ResponsePlaceOrderEntity:
        return responsePlaceOrderEntityToJson(data as ResponsePlaceOrderEntity);
      case ResponsePlaceOrderResult:
        return responsePlaceOrderResultToJson(data as ResponsePlaceOrderResult);
      case ResponseVehiclesEntity:
        return responseVehiclesEntityToJson(data as ResponseVehiclesEntity);
      case ResponseVehiclesResult:
        return responseVehiclesResultToJson(data as ResponseVehiclesResult);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle<M>(json) {
    String type = M.toString();
    if (type == (ResponsePlaceOrderEntity).toString()) {
      return ResponsePlaceOrderEntity().fromJson(json);
    } else if (type == (ResponsePlaceOrderResult).toString()) {
      return ResponsePlaceOrderResult().fromJson(json);
    } else if (type == (ResponseVehiclesEntity).toString()) {
      return ResponseVehiclesEntity().fromJson(json);
    } else if (type == (ResponseVehiclesResult).toString()) {
      return ResponseVehiclesResult().fromJson(json);
    }
    return null;
  }

  //list is returned by type
  static M _getListChildType<M>(List data) {
    if (List<ResponsePlaceOrderEntity>() is M) {
      return data
          .map<ResponsePlaceOrderEntity>(
              (e) => ResponsePlaceOrderEntity().fromJson(e))
          .toList() as M;
    } else if (List<ResponsePlaceOrderResult>() is M) {
      return data
          .map<ResponsePlaceOrderResult>(
              (e) => ResponsePlaceOrderResult().fromJson(e))
          .toList() as M;
    } else if (List<ResponseVehiclesEntity>() is M) {
      return data
          .map<ResponseVehiclesEntity>(
              (e) => ResponseVehiclesEntity().fromJson(e))
          .toList() as M;
    } else if (List<ResponseVehiclesResult>() is M) {
      return data
          .map<ResponseVehiclesResult>(
              (e) => ResponseVehiclesResult().fromJson(e))
          .toList() as M;
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}
