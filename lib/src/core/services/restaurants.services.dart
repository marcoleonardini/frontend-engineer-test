import 'dart:convert';

import 'package:frontend_engineer_test/src/core/models/restaurant.model.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  Future<List<Restaurant>> getRestaurants() async {
    var result = await http.get(
      'https://tripadvisor1.p.rapidapi.com/locations/search?query=london',
      headers: {
        'X-RapidAPI-Key': '2466a463aemsh10daabd0f3fd13cp1171a4jsn0723378229c1'
      },
    );

    var resultDecoded = jsonDecode(result.body);
    List<Restaurant> _listRestaurant = [];
    for (var item in resultDecoded['data']) {
      Restaurant restaurant = Restaurant.fromJson(item['result_object']);
      // print(item['result_object']['photo']['images']['medium']);
      print(restaurant.photo);
      _listRestaurant.add(restaurant);
    }
    return _listRestaurant;
  }
}
