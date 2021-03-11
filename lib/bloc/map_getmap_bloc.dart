import 'package:geolocator/geolocator.dart';
import 'package:navi/repository/navi_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetMapBloc {
  final NaviRepository _repository = NaviRepository();
  final BehaviorSubject<Position> _subject = BehaviorSubject<Position>();

  getCurrentPosstion() async {
    Position position = await _repository.getCurrentLocation();

    _subject.sink.add(position);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<Position> get subject => _subject;
}

final getMapBloc = GetMapBloc();
