import 'package:navi/generated/json/base/json_convert_content.dart';
import 'package:navi/generated/json/base/json_field.dart';

class ResponseVehiclesEntity with JsonConvert<ResponseVehiclesEntity> {
  @JSONField(name: "Status")
  int status;
  @JSONField(name: "Result")
  List<ResponseVehiclesResult> result;
}

class ResponseVehiclesResult with JsonConvert<ResponseVehiclesResult> {
  @JSONField(name: "ID")
  int iD;
  @JSONField(name: "Name")
  String name;
  @JSONField(name: "Photo")
  String photo;
}
