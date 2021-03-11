import 'package:navi/model/vehicles/response_vehicles_entity.dart';

responseVehiclesEntityFromJson(
    ResponseVehiclesEntity data, Map<String, dynamic> json) {
  if (json['Status'] != null) {
    data.status = json['Status'] is String
        ? int.tryParse(json['Status'])
        : json['Status'].toInt();
  }
  if (json['Result'] != null) {
    data.result = new List<ResponseVehiclesResult>();
    (json['Result'] as List).forEach((v) {
      data.result.add(new ResponseVehiclesResult().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> responseVehiclesEntityToJson(
    ResponseVehiclesEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['Status'] = entity.status;
  if (entity.result != null) {
    data['Result'] = entity.result.map((v) => v.toJson()).toList();
  }
  return data;
}

responseVehiclesResultFromJson(
    ResponseVehiclesResult data, Map<String, dynamic> json) {
  if (json['ID'] != null) {
    data.iD =
        json['ID'] is String ? int.tryParse(json['ID']) : json['ID'].toInt();
  }
  if (json['Name'] != null) {
    data.name = json['Name'].toString();
  }
  if (json['Photo'] != null) {
    data.photo = json['Photo'].toString();
  }
  return data;
}

Map<String, dynamic> responseVehiclesResultToJson(
    ResponseVehiclesResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['ID'] = entity.iD;
  data['Name'] = entity.name;
  data['Photo'] = entity.photo;
  return data;
}
