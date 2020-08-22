import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khuchra_bazar/map.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';
import 'package:flutter_progress_button/flutter_progress_button.dart';

import 'package:flutter_progress_button/flutter_progress_button.dart';



class order_page extends StatefulWidget {
  @override
  _order_pageState createState() => _order_pageState();
}

class _order_pageState extends State<order_page> {

  String dropdownValue = 'এলাকা সিলেক্ট করুন';

  String cv = 'whatsapp://send?phone= 01517096422';
  //String cv = 'https://www.facebook.com/messages/t/100005601436514';
 // String cv = 'https://www.facebook.com/profile.php?id=100005601436514';

//  Future<void> launchinapp(String url) async {
//    if(await canLaunch(cv)){
//      await launch(cv, forceSafariVC: true, forceWebView: false);
//    }
//    else{
//      throw 'Could Not launch $url';
//    }
//  }


  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  bool isbuttondisable = false;
  bool geo = false;
  var loc;
  final loccon = TextEditingController();

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
      appBar: AppBar(
        leading: RaisedButton(
          color: Colors.black,
          child: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
            onPressed: (){
              setState(() {
                print('Back icon are clicked');
              });
            }
        ),
        title: Text("সহজে কিনুন"),

        actions: [
          RaisedButton(
              color: Colors.black,
              splashColor: Colors.grey,
              child: Icon(FontAwesomeIcons.whatsappSquare,
                color: Colors.green,
                size: 40,
              ),
              onPressed: (){
                setState(() {
                  FlutterOpenWhatsapp.sendSingleMessage("+8801708194191", "Hello");
                });
              }
          ),
        ],

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("অর্ডার সামারি",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("চাষি এরোমেটিক চিনিগুড়া চাল",
                style: TextStyle(
                  fontSize: 13
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("৳ ১৩০.০০ X ২",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("=  ৳ ২৬০.০০",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("জিরা সিদ্ধ চাল",
                style: TextStyle(
                    fontSize: 13
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("৳ ৩২৫.০০ X ৩",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("=  ৳ ৯৭৫.০০",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("কাটারিভোগ চাল",
                style: TextStyle(
                    fontSize: 13
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("৳ ৩৭৫.০০ X ১",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("=  ৳ ৩৭৫.০০",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                height: 1,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("৳ পণ্যের মূল্য",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("=  ৳ ৩৭৫.০০",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("৳ ডেলিভারি চার্জ",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("=  ৳ ৭০.০০",
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),

              Divider(
                height: 1,
                color: Colors.black,
              ),

              SizedBox(height: 05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("৳ সর্বমোট মূল্য",
                      style: TextStyle(
                          fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("=  ৳ ১৬৮০.০০",
                      style: TextStyle(
                          fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text("ডেলিভারি ঠিকানা",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'নাম',
                ),
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: 'মোবাইল নম্বর',
                ),
                keyboardType: TextInputType.number,
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: 'ঠিকানা'
                ),
              ),
              //Text("$dropdownValue"),
              SizedBox(height: 20,),
              Text('Adress: ${_address?.addressLine??'-'}',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              SizedBox(height: 20,),


              RaisedButton(
                elevation: 2,
                child: Text("ম্যাপ থেকে সিলেক্ট করুন",
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>map()));

                  });
                },
                onLongPress: isbuttondisable ? null : () {},
              ),

              SizedBox(height: 20,),

              DropdownButton(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                items: <String>['এলাকা সিলেক্ট করুন', 'আন্দরকিল্লা', 'আরকান হাউজিং', 'কাজীর দেউড়ি','কাতালগঞ্জ','কাপাসগোলা','খুলসি','গরিবুল্লা শাহ এরিয়া','চকবাজার','চান্দগাও আবাসিক','জামাল খান','জি ই সি','দেওয়ান বাজার','নাসিরাবাদ','নিউ মার্কেট','পাঁচশাইল','মেহেদিবাগ','লাভ লেইন','লালখান বাজার','শুলকবহর','সুগন্ধা']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
              ),
              SizedBox(height: 10,),
              Text("কিভাবে পেমেন্ট করবেন?",
                style: TextStyle(
                  fontSize: 15
                ),
              ),

              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.pinkAccent,
                    onChanged: (String){
                      print('Value');
                    },
                  ),

                  Text("ক্যাশ অন ডেলিভারি",
                    style: TextStyle(
                      fontSize: 15
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  void showAddress(){

    setState(() {
       Text("${_address?.addressLine??'-'}");
    });
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
