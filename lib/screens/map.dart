import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*class map extends StatefulWidget {
  map({Key? key}) : super(key: key);

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  // Completer<GoogleMapController> _controller = Completer();

  var _position = [];
  DocumentReference<Map<String, dynamic>> signsref = FirebaseFirestore.instance
      .collection("babies")
      .doc("1254")
      .collection("vital")
      .doc("gps");
  getsigns() async {
    var response = await signsref.get();
    setState(() {
      _position.add(response.data());
    });
    print(_position);
  }

  @override
  void initState() {
    // TODO: implement initState
    // getBaby();
    getsigns();
    super.initState();
  }

  var marker = HashSet<Marker>();
  

  static final CameraPosition _intialPosition = CameraPosition(
    target: LatLng(31.049926, 31.380157),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _position.isEmpty || _position == null
          ? Text("loading")
          : Stack(
              children: [
                GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _intialPosition,
                  onMapCreated: (googleMapController) {
                    setState(() {
                      marker.add(
                        Marker(
                          markerId: MarkerId('1'),
                          position: LatLng(double.parse(_position[0]['lat']),
                              double.parse(_position[0]['long'])),
                        ),
                      );
                    });
                  },
                  markers: marker,
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}*/
class map extends StatelessWidget {
  map({Key? key}) : super(key: key);
  var marker = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("babies")
          .doc("1254")
          .collection("vital")
          .doc("gps")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final _position = snapshot.data!.data() as Map<String, dynamic>;
        var _intialPosition = CameraPosition(
          target: LatLng(
              double.parse(_position['lat']), double.parse(_position['long'])),
          zoom: 14.4746,
        );

        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _intialPosition,
                onMapCreated: (googleMapController) {
                  marker.add(
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(double.parse(_position['lat']),
                          double.parse(_position['long'])),
                    ),
                  );
                },
                markers: [
                  Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(double.parse(_position['lat']),
                        double.parse(_position['long'])),
                  )
                ].toSet(),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        );
      },
    );
  }
}
