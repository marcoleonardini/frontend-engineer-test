import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/src/core/models/restaurant.model.dart';
import 'package:frontend_engineer_test/src/core/services/restaurants.services.dart';

class HomePage extends StatelessWidget {
  static final String route = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              TextFormField(),
              FlatButton(
                color: Colors.orange,
                child: Text('Search'),
                onPressed: () {},
              ),
              Divider(),
              Expanded(
                child: FutureBuilder<List<Restaurant>>(
                  future: RestaurantService().getRestaurants(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Restaurant restaurant = snapshot.data[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(restaurant.photo),
                          ),
                          title: Text(restaurant.name),
                          subtitle: Text(
                              'Reviews by ${restaurant.numReviews} people'),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
