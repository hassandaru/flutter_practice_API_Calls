import 'package:flutter/material.dart';
import 'package:flutter_practice_api_calls/models/location.dart';
import 'mocks/mock_location.dart';
import 'location_list.dart';

void main() {
   // final Location mockLocation = MockLocation.FetchAny();
   // return runApp( MaterialApp(home: LocationDetail(mockLocation)));
   final mockLocations = MockLocation.fetchAll();
   //run on windows
   return runApp(MaterialApp(home: LocationList(mockLocations)));
}

