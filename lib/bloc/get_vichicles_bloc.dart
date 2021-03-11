import 'package:navi/model/vehicles/response_vehicles_entity.dart';
import 'package:navi/repository/navi_repository.dart';
import 'package:navi/utilts/data_response.dart';
import 'package:rxdart/rxdart.dart';

class GetVichicleBloc {
  final NaviRepository _repository = NaviRepository();
  final BehaviorSubject<DataResponse<ResponseVehiclesEntity>> _subject =
      BehaviorSubject<DataResponse<ResponseVehiclesEntity>>();

  GetVichicles() async {
    DataResponse<ResponseVehiclesEntity> response =
        await _repository.getVehicles();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DataResponse<ResponseVehiclesEntity>> get subject => _subject;
}

final getVichicleBloc = GetVichicleBloc();
