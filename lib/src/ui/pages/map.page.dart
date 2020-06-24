import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:frontend_engineer_test/src/core/models/restaurant.model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatelessWidget {
  Restaurant restaurant;
  static final String route = 'map';

  @override
  Widget build(BuildContext context) {
    restaurant = ModalRoute.of(context).settings.arguments;
    print(restaurant.name);
    LatLng latLngRestaurant = LatLng(
        double.parse(restaurant.latitude), double.parse(restaurant.longitude));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom Maps'),
        ),
        body: FutureBuilder<Position>(
            future: Geolocator()
                .getCurrentPosition(desiredAccuracy: LocationAccuracy.high),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              print(snapshot.data);
              LatLng latLngDevice =
                  LatLng(snapshot.data.latitude, snapshot.data.longitude);
              return FlutterMap(
                options: MapOptions(
                  center: latLngDevice,
                  zoom: 6.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: latLngRestaurant,
                        builder: (ctx) => Container(
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: latLngDevice,
                        builder: (ctx) => Container(
                          child: Icon(Icons.pin_drop),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
