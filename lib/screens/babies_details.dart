import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/camera.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:bi_tracer/shared/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bi_tracer/screens/map.dart';

_launchURLApp() async {
  const url = 'http://192.168.253.44';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
/*
class BabyDetails extends StatefulWidget {
  var baby;
  BabyDetails({Key? key, required this.baby}) : super(key: key);

  @override
  State<BabyDetails> createState() => _BabyDetailsState();
}

class _BabyDetailsState extends State<BabyDetails> {
  // Baby baby = Baby();
  List baby = [];
  String name = "yousef";
  DocumentReference<Map<String, dynamic>> babyreference =
      FirebaseFirestore.instance.collection('babies').doc('1254');
  DocumentReference<Map<String, dynamic>> signsref = FirebaseFirestore.instance
      .collection("babies")
      .doc("1254")
      .collection("vital")
      .doc("signs");

  // getBaby() async {
  //   babyreference.get().then((value) {
  //     baby.add(value['name']);
  //   });
  // }

  getsigns() async {
    var response = await signsref.get();
    setState(() {
      baby.add(response.data());
    });
    // print(baby);
  }

  @override
  void initState() {
    // TODO: implement initState
    // getBaby();
    getsigns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Profile"),
      ),
      body: baby.isEmpty || baby == null
          ? Text("loading")
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Card(
                              color: mainColor,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.baby,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    myText(name.toUpperCase(),
                                        size: 30, color: Colors.white),
                                  ],
                                ),
                              ))),
                      ListTile(
                        title: Text("Baby Temp"),
                        trailing: IconButton(
                            onPressed: () {
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.temperatureLow,
                              color: mainColor,
                            )),
                        subtitle:
                            Text("${baby[0]['Temperature']}" ?? "Nodat a"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Motion"),
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: Icon(
                              Icons.run_circle_outlined,
                              color: mainColor,
                            )),
                        subtitle: Text("${baby[0]['Motion']}" ?? "Nodata"),
                      ),
                      Divider(),
                      ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              // FireStoreHelper.showOrNot(baby.babyId,
                              //     "showYellowColor", !baby.showYellowColor!);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.babyCarriage,
                              color: mainColor,
                            )),
                        title: Text("Baby Jaundice"),
                        subtitle: Text(baby[0]['Jaundice'] ?? "Nodata"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Baby Heart Rate"),
                        trailing: IconButton(
                          onPressed: () {
                            // FireStoreHelper.showOrNot(
                            //     baby.babyId, "showHeartpulse", !baby.showHeartpulse!);
                          },
                          icon: FaIcon(FontAwesomeIcons.heartbeat),
                          color: mainColor,
                        ),
                        subtitle: Text("${baby[0]['HeartRate']}" ?? "Nodata"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Oxygen Saturation Level"),
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: Icon(
                              Icons.ad_units_rounded,
                              color: mainColor,
                            )),
                        subtitle: Text(baby[0]['Jaundice'] ?? "Nodata"),
                      ),
                      Divider(),
                      Center(
                        child: ListTile(
                          title: Text("Baby Location"),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => map()),
                                );
                              },
                              icon: FaIcon(FontAwesomeIcons.locationArrow)),
                          subtitle: Text("Press here to show location"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => map()),
                            );
                          },
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Baby Live Camera"),
                        trailing: IconButton(
                          onPressed: _launchURLApp,
                          icon: FaIcon(FontAwesomeIcons.camera),
                          color: null,
                        ),
                        subtitle: Text("Press here to show camera"),
                        onTap: () {
                          _launchURLApp;
                        },
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
*/

class BabyDetails extends StatelessWidget {
  BabyDetails({Key? key, required this.baby}) : super(key: key);
  Baby baby;
  // final Stream<DocumentSnapshot<Map<String, dynamic>>> signs = FirebaseFirestore
  //     .instance
  //     .collection('babies')
  //     .doc('1254')
  //     .collection('vital')
  //     .doc('signs')
  //     .snapshots();

  @override
  Widget build(BuildContext context) {
    /* baby = Baby(
        gender: "female",
        name: "sara ahmed ",
        temp: "12",
        heartPulse: "1231",
        mother: Mother(
          email: "sdsd@gmail.com",
          name: "sara ahmed ",
          fatherName: "ahmed",
          fatherPhone: "010123123",
          motherPhone: "0123124124",
        ),
        yellowColor: "20",
        showTemp: false,
        showGps: false,
        showYellowColor: false,
        showHeartpulse: false,
        showCamera: true);
 */
    return StreamBuilder<DocumentSnapshot>(
        stream: //null,
            FirebaseFirestore.instance
                .collection('babies')
                .doc('1254')
                .collection("vital")
                .doc("signs")
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Text("Baby Profile"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Card(
                              color: mainColor,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.baby,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    myText(baby.name!.toUpperCase(),
                                        size: 30, color: Colors.white),
                                  ],
                                ),
                              ))),
                      ListTile(
                        title: Text("Baby Temperature"),
                        trailing: IconButton(
                            onPressed: () {
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.temperatureLow,
                              color: mainColor,
                            )),
                        subtitle:
                            Text(data['Temperature'].toString() ?? "Nodat a"),
                      ),
                      ListTile(
                        title: Text("Motion Level"),
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: Icon(
                              Icons.run_circle_outlined,
                              color: mainColor,
                            )),
                        subtitle: Text(data['Motion'] ?? "Nodata"),
                      ),
                      ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(baby.babyId,
                              //     "showYellowColor", !baby.showYellowColor!);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.babyCarriage,
                              color: mainColor,
                            )),
                        title: Text("Jaundice Level"),
                        subtitle: Text(data['Jaundice'] ?? "Nodata" + "%"),
                      ),
                      ListTile(
                        title: Text("Baby Heart Rate"),
                        trailing: IconButton(
                          onPressed: () {
                            null;
                            // FireStoreHelper.showOrNot(baby.babyId,
                            //     "showHeartpulse", !baby.showHeartpulse!);
                          },
                          icon: FaIcon(FontAwesomeIcons.heartbeat),
                          color: mainColor,
                        ),
                        subtitle:
                            Text(data['HeartRate'].toString() ?? "Nodata"),
                      ),
                      ListTile(
                        title: Text("Oxygen Saturation Percentage"),
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: Icon(
                              Icons.ad_units_rounded,
                              color: mainColor,
                            )),
                        subtitle: Text(data['SPO2'].toString() ?? "Nodata"),
                      ),
                      ListTile(
                        title: Text("Crying Status"),
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: Icon(
                              Icons.bedroom_baby_outlined,
                              color: mainColor,
                            )),
                        subtitle: Text(data['state'] ?? "Nodata"),
                      ),
                      Divider(),
                      Center(
                        child: ListTile(
                          title: Text("Baby Location"),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => map()),
                                );
                              },
                              icon: FaIcon(FontAwesomeIcons.locationArrow)),
                          subtitle: Text("Press here to show location"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => map()),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Baby Live Camera"),
                        trailing: IconButton(
                          onPressed: _launchURLApp,
                          icon: FaIcon(FontAwesomeIcons.camera),
                          color: null,
                        ),
                        subtitle: Text("Press here to show camera"),
                        onTap: () {
                          _launchURLApp();
                        },
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
