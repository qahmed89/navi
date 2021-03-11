import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:navi/widget/bottom_sheet.dart';

import 'file:///D:/work/flutter/navi/lib/element/loader.dart';

import '../bloc/map_getmap_bloc.dart';

class MappScreen extends StatefulWidget {
  @override
  _MappScreenState createState() => _MappScreenState();
}

class _MappScreenState extends State<MappScreen> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _lastMapPostion;
  final Set<Marker> _marker = {};
  MapType _mapType = MapType.normal;

  void _onAddMarkerButtonPressed(LatLng position) {
    _marker.clear();
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(
            title: 'This is a Title',
            snippet: 'This is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMapBloc..getCurrentPosstion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Stack(children: [
              StreamBuilder<Position>(
                  stream: getMapBloc.subject,
                  // ignore: missing_return
                  builder: (context, AsyncSnapshot<Position> snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data.longitude);

                      _lastMapPostion = LatLng(
                          snapshot.data.latitude, snapshot.data.longitude);

                      return GoogleMap(
                        myLocationEnabled: true,
                        onMapCreated: _onMapCreated,
                        initialCameraPosition:
                            CameraPosition(target: _lastMapPostion, zoom: 15.0),
                        mapType: _mapType,
                        markers: _marker,
                        onTap: (value) {
                          _onAddMarkerButtonPressed(value);
                        },
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return buildLoadingWidget();
                    }
                  }),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(1.0, 1.0))
                    ]),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                child: Icon(Icons.account_circle_outlined)),
                            Expanded(
                              child: DottedLine(
                                direction: Axis.vertical,
                                lineLength:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                            ),
                            Expanded(
                                child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(" From :"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Down Towan Cairo ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Text(" To    :"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " Nile Ritz-Carlton ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            settingModalBottomSheet(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.directions_car),
        ));
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPostion = position.target;
  }
}
