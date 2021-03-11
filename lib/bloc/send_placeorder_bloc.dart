import 'package:navi/model/placeorder/response_place_order_entity.dart';
import 'package:navi/repository/navi_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../utilts/data_response.dart';

class SendPlaceOrderBloc {
  final NaviRepository _repository = NaviRepository();
  BehaviorSubject<DataResponse<ResponsePlaceOrderEntity>> _subject =
      BehaviorSubject<DataResponse<ResponsePlaceOrderEntity>>();

  sendPlaceOrder(String origin, String destination, int vehicleID) async {
//  _subject.value=DataResponse.loading();
    DataResponse<ResponsePlaceOrderEntity> response =
        await _repository.sendPlaceOrder(origin, destination, vehicleID);
    _subject.sink.add(response);
  }

  void drainStream() => _subject = null;

  void dispose() async {
    _subject.close();
  }

  BehaviorSubject<DataResponse<ResponsePlaceOrderEntity>> get subject =>
      _subject;
}

final sendPlaceOrder = SendPlaceOrderBloc();
