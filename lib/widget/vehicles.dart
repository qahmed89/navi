import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:navi/bloc/get_vichicles_bloc.dart';
import 'package:navi/bloc/send_placeorder_bloc.dart';
import 'package:navi/constants.dart';
import 'package:navi/element/error_element.dart';
import 'package:navi/model/vehicles/response_vehicles_entity.dart';
import 'package:rxdart/rxdart.dart';

import '../element/alert_dialog.dart';
import '../element/loader.dart';
import '../utilts/data_response.dart';

class VehiclesWidgets extends StatefulWidget {
  @override
  _VehiclesWidgetsState createState() => _VehiclesWidgetsState();
}

class _VehiclesWidgetsState extends State<VehiclesWidgets> {
  final _slider = BehaviorSubject<double>();

  BehaviorSubject<double> get sliderStream => _slider.stream;
  String labelSlider = "Please Choose";
  int chooseCar = 1;

  void updateSelectCar(int car) {
    setState(() {
      chooseCar = car;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVichicleBloc..GetVichicles();
    sendPlaceOrder.subject.listen((value) {
      switch (value.status) {
        case Status.Loading:
          return CircularProgressIndicator(
            backgroundColor: Colors.red,
          );
        case Status.Success:
          ShowAlart(
              context: context,
              desc: value.res.result.orderID.toString(),
              title: "Your OrderId Is:",
              dialogType: DialogType.SUCCES,
              color: Colors.green);
          break;
        case Status.Error:
          ShowAlart(
              context: context,
              desc: 'Please check you Internet',
              title: "Error",
              dialogType: DialogType.ERROR,
              color: Colors.red);
          break;
      }
    });
    //ScaffoldMessenger.of(context).showSnackBar(snackBar)

  }

  @override
  Widget build(BuildContext context) {
    return

         StreamBuilder<DataResponse<ResponseVehiclesEntity>>(
            stream: getVichicleBloc.subject,
            // ignore: missing_return
            builder: (context,
                AsyncSnapshot<DataResponse<ResponseVehiclesEntity>> snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.Success:
                    return StreamBuilder(
                      builder:
                          (BuildContext context, AsyncSnapshot<double> snapshots) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Image.asset("assets/economy.jpg"),
                                          ),
                                          Text(
                                            snapshot.data.res.result[0].name,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xFF747474),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset("assets/vip.jpg"),
                                          ),
                                          Text(
                                            snapshot.data.res.result[1].name,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xFF747474),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    inactiveTrackColor: Color(0xFF8D8E98),
                                    activeTrackColor: Colors.grey,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 10.0),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 15.0),
                                    thumbColor: Colors.blue,
                                    overlayColor: Color(0x29EB1555)),
                                child: Slider(
                                  label: labelSlider,
                                  min: 0.0,
                                  max: 2.0,
                                  divisions: 2,
                                  onChanged: (newRating) {
                                    _slider.sink.add(newRating);
                                    switch (newRating.round()) {
                                      case 1:
                                        labelSlider = "Please Choose";
                                        break;
                                      case 0:
                                        labelSlider =
                                            snapshot.data.res.result[0].name;
                                        updateSelectCar(
                                            snapshot.data.res.result[0].iD);
                                        break;
                                      case 2:
                                        labelSlider =
                                            snapshot.data.res.result[1].name;
                                        updateSelectCar(
                                            snapshot.data.res.result[1].iD);

                                        break;
                                    }
                                  },
                                  value: snapshots.data,
                                ),
                              )),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Distance: ",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "5.2km | 10min",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "60",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "EGP",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: FlatButton(
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10.0))),
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                  color: Colors.blueAccent,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // getAlart(context);
                                    if (labelSlider != "Please Choose") {
                                      sendPlaceOrder
                                        ..sendPlaceOrder(
                                            kOrigin, kDestination, chooseCar);


                                    }else{
                                      final snackBar = new SnackBar(content: new Text(labelSlider),
                                          backgroundColor: Colors.red);
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                      // Find the Scaffold in the Widget tree and use it to show a SnackBar

                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      initialData: 1.0,
                      stream: sliderStream,
                    );
                    break;
                  case Status.Error:
                    return buildErrorWidget(snapshot.error.toString());
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return buildLoadingWidget();
              } else if (snapshot.hasError) {
                buildErrorWidget(snapshot.error.toString());
              }
            }


    );

  }

  void getAlart(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Your OrderID is',
      desc: '1234',
      btnOkOnPress: () {},
    )..show();
  }
}
