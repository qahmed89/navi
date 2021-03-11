import 'package:navi/generated/json/base/json_convert_content.dart';
import 'package:navi/generated/json/base/json_field.dart';

class ResponsePlaceOrderEntity with JsonConvert<ResponsePlaceOrderEntity> {
  @JSONField(name: "Status")
  int status;
  @JSONField(name: "Result")
  ResponsePlaceOrderResult result;
}

class ResponsePlaceOrderResult with JsonConvert<ResponsePlaceOrderResult> {
  int orderID;
}
