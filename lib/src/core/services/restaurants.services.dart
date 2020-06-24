import 'dart:convert';

import 'package:frontend_engineer_test/src/core/const/services.const.dart';
import 'package:frontend_engineer_test/src/core/models/restaurant.model.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  Future<List<Restaurant>> getRestaurants({String city}) async {
    var queryParameters = {
      'query': city,
    };
    var uri = Uri.https(ServicesConst.restaurantsBaseURL,
        ServicesConst.restaurantsSearch, queryParameters);
    var result = await http.get(
      uri,
      headers: {'X-RapidAPI-Key': ServicesConst.serverKey},
    );

    var resultDecoded = jsonDecode(result.body);
    List<Restaurant> _listRestaurant = [];
    for (var item in resultDecoded['data']) {
      Restaurant restaurant = Restaurant.fromJson(item['result_object']);
      print(restaurant.photo);
      _listRestaurant.add(restaurant);
    }
    return _listRestaurant;
  }
}
