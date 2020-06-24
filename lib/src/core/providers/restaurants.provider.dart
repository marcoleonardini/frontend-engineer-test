import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:frontend_engineer_test/src/core/models/restaurant.model.dart';
import 'package:frontend_engineer_test/src/core/services/restaurants.services.dart';

class RestaurantsProvider extends ChangeNotifier {
  List<Restaurant> _restaurants = [];

  bool isLoading = false;

  void getRestaurants({String city = 'paris'}) async {
    isLoading = true;
    notifyListeners();
    _restaurants = await RestaurantService().getRestaurants(city: city);

    isLoading = false;
    notifyListeners();
  }

  List<Restaurant> get restautants => UnmodifiableListView(_restaurants);
}
