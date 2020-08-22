import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';


class map extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {


  AnimationController controller;
  Animation<double> animation;


  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position position) {
      setState(() {
        print("Position");
        _position = position;

        final coordinates = new Coordinates(position.latitude, position.longitude);
        convertCoordinateToAddress(coordinates).then((value) => _address = value);

      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Location lat: ${_position?.latitude??'-'},lon: ${_position?.longitude??'-'}"
            ),
            SizedBox(height: 20,),
            Text("Address from coordinate"),
            SizedBox(height: 20,),
            Text("${_address?.addressLine??'-'}"),
          ],
        ),
      ),
    );
  }

  void dispose(){
    super.dispose();
    _streamSubscription.cancel();
  }

  Future convertCoordinateToAddress(Coordinates coordinates) async {

    var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return address.first;

  }
}
