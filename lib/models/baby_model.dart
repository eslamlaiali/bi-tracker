import 'dart:convert';

import 'package:bi_tracer/models/mother_model.dart';

class Baby {
  String? name;
  String? dateOfBirth;
  String? gender;
  String? temp;
  String? lattude;
  String? longtude;
  String? heartPulse;
  String? yellowColor;
  String? camera;
  String? babyId;
  bool? showTemp;
  bool? showGps;
  bool? showHeartpulse;
  bool? showYellowColor;
  bool? showCamera;
  Mother? mother;
  Baby({
    this.name,
    this.dateOfBirth,
    this.gender,
    this.temp,
    this.lattude,
    this.longtude,
    this.heartPulse,
    this.yellowColor,
    this.camera,
    this.babyId,
    this.showTemp,
    this.showGps,
    this.showHeartpulse,
    this.showYellowColor,
    this.showCamera,
    this.mother,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'temp': temp,
      'lattude': lattude,
      'longtude': longtude,
      'heartPulse': heartPulse,
      'yellowColor': yellowColor,
      'camera': camera,
      'babyId': babyId,
      'showTemp': showTemp,
      'showGps': showGps,
      'showHeartpulse': showHeartpulse,
      'showYellowColor': showYellowColor,
      'showCamera': showCamera,
      'mother': mother?.toMap(),
    };
  }

  factory Baby.fromMap(Map<String, dynamic> map) {
    return Baby(
      name: map['name'] != null ? map['name'] : null,
      dateOfBirth: map['dateOfBirth'] != null ? map['dateOfBirth'] : null,
      gender: map['gender'] != null ? map['gender'] : null,
      temp: map['temp'] != null ? map['temp'] : null,
      lattude: map['lattude'] != null ? map['lattude'] : null,
      longtude: map['longtude'] != null ? map['longtude'] : null,
      heartPulse: map['heartPulse'] != null ? map['heartPulse'] : null,
      yellowColor: map['yellowColor'] != null ? map['yellowColor'] : null,
      camera: map['camera'] != null ? map['camera'] : null,
      babyId: map['babyId'] != null ? map['babyId'] : null,
      showTemp: map['showTemp'] != null ? map['showTemp'] : null,
      showGps: map['showGps'] != null ? map['showGps'] : null,
      showHeartpulse:
          map['showHeartpulse'] != null ? map['showHeartpulse'] : null,
      showYellowColor:
          map['showYellowColor'] != null ? map['showYellowColor'] : null,
      showCamera: map['showCamera'] != null ? map['showCamera'] : null,
      mother: map['mother'] != null ? Mother.fromMap(map['mother']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Baby.fromJson(String source) => Baby.fromMap(json.decode(source));

  Baby copyWith({
    String? name,
    String? dateOfBirth,
    String? gender,
    String? temp,
    String? lattude,
    String? longtude,
    String? heartPulse,
    String? yellowColor,
    String? camera,
    String? babyId,
    bool? showTemp,
    bool? showGps,
    bool? showHeartpulse,
    bool? showYellowColor,
    bool? showCamera,
    Mother? mother,
  }) {
    return Baby(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      temp: temp ?? this.temp,
      lattude: lattude ?? this.lattude,
      longtude: longtude ?? this.longtude,
      heartPulse: heartPulse ?? this.heartPulse,
      yellowColor: yellowColor ?? this.yellowColor,
      camera: camera ?? this.camera,
      babyId: babyId ?? this.babyId,
      showTemp: showTemp ?? this.showTemp,
      showGps: showGps ?? this.showGps,
      showHeartpulse: showHeartpulse ?? this.showHeartpulse,
      showYellowColor: showYellowColor ?? this.showYellowColor,
      showCamera: showCamera ?? this.showCamera,
      mother: mother ?? this.mother,
    );
  }
}
