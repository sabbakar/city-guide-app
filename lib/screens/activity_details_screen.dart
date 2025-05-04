import 'package:flutter/material.dart';
import 'package:city_guide_ui/models/activity_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:geolocator/geolocator.dart';

class ActivityDetailsScreen extends StatelessWidget {
//   Future<void> _getDirections(Activity activity) async {
//     // Get the current location
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     double currentLatitude = position.latitude;
//     double currentLongitude = position.longitude;

//     //  OpenStreetMap
//     final url = 'https://www.openstreetmap.org/directions?engine=osrm_car&route=${activity.latitude},${activity.longitude};${currentLatitude},${currentLongitude}';
    
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
 void _getDirections(Activity activity) async {
  final url = Uri.parse(activity.directionsLink); // to convert String to Uri
  
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    final Activity activity = ModalRoute.of(context)!.settings.arguments as Activity;

    return Scaffold(
      appBar: AppBar(title: Text(activity.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(activity.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(activity.name, style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Activity Type: ${activity.type}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Price: \$${activity.price}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Text('Rating: '),
                  for (var i = 0; i < 5; i++)
                    Icon(
                      i < activity.rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  // to launch the external link for more information
                  launch(activity.infoLink);
                },
                child: Text(
                  'More Information',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => _getDirections(activity), // updated to use directionsLink
                child: Text('Get Directions'),
              ),
            ),
            SizedBox(
              height: 300,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(activity.latitude, activity.longitude),
                  initialZoom: 14,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(activity.latitude, activity.longitude),
                        width: 80,
                        height: 80,
                        child: Icon(Icons.location_pin, color: Colors.red, size: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
