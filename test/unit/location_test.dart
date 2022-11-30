import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:flutter_practice_api_calls/models/location.dart';

void main() {

  // test('test location deserialization', ()  {

    // const locationJSON =
    //     '{ "name": "Arashiyama Bamboo Grove", "url": "https://cdn-images-1.medium.com/max/2000/1*vdJuSUKWl_SA9Lp-32ebnA.jpeg","facts": [{ "title": "Summary", "text": "This bamboo grove is on the outskirts of Kyoto. " }] }';
    //
    // final locationMap = jsonDecode(locationJSON);
    //
    // expect("Arashiyama Bamboo Grove", equals(locationMap['name']));
    //
    // final location = Location.fromJson(locationMap);
    //
    // expect(location.name, equals(locationMap['name']));
    // expect(location.url, equals(locationMap['url']));
    //
    // expect(location.facts[0].title, matches(locationMap['facts'][0]['title']));
    // expect(location.facts[0].text, matches(locationMap['facts'][0]['text']));

  // });

  //from real JSON call
  test('test /locations and /locations/:id', () async {
    final locations = await Location.fetchAll();
    for (var location in locations) {
      expect(location.id, greaterThan(0));
      expect(location.name, hasLength(greaterThan(0)));
      expect(location.url, hasLength(greaterThan(0)));

      final fetchedLocation = await Location.fetchByID(location.id);
      expect(fetchedLocation.name, equals(location.name));
      expect(fetchedLocation.url, equals(location.url));
      // expect(fetchedLocation.facts, hasLength(greaterThan(0)));
    }
  });
}