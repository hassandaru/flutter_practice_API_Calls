import 'location_fact.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:flutter_practice_api_calls/endpoint.dart';

import 'package:http/http.dart' as http;

part 'location.g.dart' ;

// remember to run flutter packages pub run
// build_runner build after setting serializable up
// flutter packages pub run build_runner build

//to update mode; we use
//flutter clean
//flutter pub get
//flutter packages pub run build-runner build --delete-conflicting-outputs


@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  Location({required this.id, required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];
    print(resp.body);
    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}
