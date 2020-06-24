import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/src/core/models/restaurant.model.dart';
import 'package:frontend_engineer_test/src/core/providers/restaurants.provider.dart';
import 'package:frontend_engineer_test/src/core/providers/user.provider.dart';
import 'package:frontend_engineer_test/src/ui/pages/history.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/login.page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String route = 'home';

  String _city = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'Welcome ${Provider.of<UserProvider>(context).user.username}'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false).unsetUser();
                  Navigator.pushReplacementNamed(context, LoginPage.route);
                })
          ],
        ),
        floatingActionButton: (FloatingActionButton(
          child: Icon(Icons.history),
          onPressed: () => Navigator.pushNamed(context, HistoryPage.route),
        )),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _city = value,
              ),
              FlatButton(
                color: Colors.orange,
                child: Text('Search'),
                onPressed: () {
                  Provider.of<RestaurantsProvider>(context, listen: false)
                      .getRestaurants(city: _city);
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(child: Consumer<RestaurantsProvider>(
                builder: (context, restaurantProvider, __) {
                  var _list = restaurantProvider.restautants;
                  if (restaurantProvider.isLoading)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (_list.isEmpty)
                    return Center(
                      child: Text('No results'),
                    );
                  return ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      Restaurant restaurant = _list[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(restaurant.photo),
                        ),
                        title: Text(restaurant.name),
                        subtitle:
                            Text('Reviews by ${restaurant.numReviews} people'),
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
