import 'package:flutter/material.dart';
import 'package:city_guide_ui/models/destination_model.dart';
import 'package:city_guide_ui/models/activity_model.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  final List<Destination> destinations = [
    Destination(
      imageUrl: 'assets/images/aso_rock.jpeg',
      city: 'Zuma Rock',
      country: 'ABUJA',
      activities: [
        Activity(
          imageUrl: 'assets/images/Aso_Rock_.jpg',
          name: 'Aso Rock',
          type: 'Sightseeing',
          startTimes: ['9:00 am', '6:00 pm'],
          rating: 5,
          price: 0,
          latitude: 9.0861,
          longitude: 7.4929,
          infoLink: 'https://wikipedia.org/wiki/Zuma_Rock',
          directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route={start_latitude},{start_longitude};${37.820045575304775},${-122.47868558196315}',
        ),
      ],
    ),
    Destination(
      imageUrl: 'assets/images/millenium_park.jpeg',
      city: 'Central Park',
      country: 'ABUJA',
      activities: [
        Activity(
          imageUrl: 'assets/images/Millenium_Park.jpg',
          name: 'Millennium Park',
          type: 'Sightseeing',
          startTimes: ['9:00 am', '6:00 pm'],
          rating: 4,
          price: 0,
          latitude: 9.0545,
          longitude: 7.4866,
          infoLink: 'https://wikipedia.org/wiki/Millennium_Park',
          directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route={start_latitude},{start_longitude};9.0545,7.4866',
        ),
      ],
    ),
    Destination(
      imageUrl: 'assets/images/Jabi_Lake.jpeg',
      city: 'Water Front',
      country: 'ABUJA',
      activities: [
        Activity(
          imageUrl: 'assets/images/Jabi_lake.jpg',
          name: 'Jabi Lake',
          type: 'Recreation',
          startTimes: ['9:00 am', '8:00 pm'],
          rating: 4,
          price: 0,
          latitude: 9.0562,
          longitude: 7.4132,
          infoLink: 'https://wikipedia.org/wiki/Jabi_Lake',
          directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route={start_latitude},{start_longitude};9.0562,7.4132',
        ),
      ],
    ),
    Destination(
      imageUrl: 'assets/images/National_Mosque.jpeg',
      city: 'National Mosque',
      country: 'ABUJA',
      activities: [
        Activity(
          imageUrl: 'assets/images/Abuja_National_Mosque.jpg',
          name: 'National Mosque of Nigeria',
          type: 'Religious',
          startTimes: ['9:00 am', '6:00 pm'],
          rating: 5,
          price: 0,
          latitude: 9.0480,
          longitude: 7.4926,
          infoLink: 'https://wikipedia.org/wiki/National_Mosque_of_Nigeria',
          directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route={start_latitude},{start_longitude};9.0480,7.4926',
        ),
      ],
    ),
    Destination(
      imageUrl: 'assets/images/Usman_Dam.jpeg',
      city: 'Waterworks',
      country: 'ABUJA',
      activities: [
        Activity(
          imageUrl: 'assets/images/usman_dam.jpg',
          name: 'Usman Dam',
          type: 'Sightseeing',
          startTimes: ['9:00 am', '6:00 pm'],
          rating: 4,
          price: 0,
          latitude: 9.2233,
          longitude: 7.3832,
          infoLink: 'https://wikipedia.org/wiki/Usman_Dam',
          directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route={start_latitude},{start_longitude};9.2233,7.3832',
        ),
      ],
    ),
      Destination(
    imageUrl: 'assets/images/Bistro7.jpg',
    city: 'Bistro 7',
    country: 'ABUJA',
    activities: [
      Activity(
        imageUrl: 'assets/images/bistro7.jpg',
        name: 'Bistro 7',
        type: 'Restaurant',
        startTimes: ['10:00 am', '11:00 pm'],
        rating: 4,
        price: 1000,
        latitude: 9.078379785405293,
        longitude: 7.480731307224957,
        infoLink: 'https://www.instagram.com/sevenbistrong/',
        directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route=9.078379785405293,7.480731307224957',
      ),
    ],
  ),
  Destination(
    imageUrl: 'assets/images/Charcoal.jpeg',
    city: 'The Charcoal Grill',
    country: 'ABUJA',
    activities: [
      Activity(
        imageUrl: 'assets/images/charcoal.jpg',
        name: 'The Charcoal Grill',
        type: 'Restaurant',
        startTimes: ['10:00 am', '10:00 pm'],
        rating: 4,
        price: 1500,
        latitude: 9.073645071826473,
        longitude: 7.471313383763555,
        infoLink: 'https://www.instagram.com/thecharcoalgrillabuja/',
        directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route=9.0644,7.4912',
      ),
    ],
  ),
  Destination(
    imageUrl: 'assets/images/Church.jpeg',
    city: 'National Church',
    country: 'ABUJA',
    activities: [
      Activity(
        imageUrl: 'assets/images/church.jpg',
        name: 'National Ecumenical Center',
        type: 'Religious',
        startTimes: ['8:00 am', '7:00 pm'],
        rating: 5,
        price: 0,
        latitude: 9.052228161841661, 
        longitude: 7.494304551238592,
        infoLink: 'https://en.wikipedia.org/wiki/National_Christian_Centre',
        directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route=9.052228161841661,7.494304551238592',
      ),
    ],
  ),
  Destination(
    imageUrl: 'assets/images/Museum.jpg',
    city: 'Museum',
    country: 'ABUJA',
    activities: [
      Activity(
        imageUrl: 'assets/images/museum.jpg',
        name: 'Discovery Museum Abuja',
        type: 'Museum',
        startTimes: ['9:00 am', '6:00 pm'],
        rating: 5,
        price: 500,
        latitude: 9.076924720115615, 
        longitude: 7.486991253083758,
        infoLink: 'https://www.tripadvisor.com/Attraction_Review-g293825-d21720679-Reviews-Discovery_Park_Abuja-Abuja_Federal_Capital_Territory.html',
        directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route=9.076829369754316,7.486926880073899',
      ),
    ],
  ),
  Destination(
    imageUrl: 'assets/images/Cafe.jpeg',
    city: 'Café Royale',
    country: 'ABUJA',
    activities: [
      Activity(
        imageUrl: 'assets/images/Cafe.jpeg',
        name: 'Royale Express Cafe And Restaurant',
        type: 'Restaurant',
        startTimes: ['8:00 am', '10:00 pm'],
        rating: 5,
        price: 1200,
        latitude: 9.093098197095188, 
        longitude: 7.499211767627458,
        infoLink: 'https://www.instagram.com/caferoyallagos/',
        directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route=9.093098197095188,7.499211767627458',
      ),
    ],
  ),
  
  Destination(
    imageUrl: 'assets/images/Lounge.jpg',
    city: 'Sky Lounge',
    country: 'ABUJA',
    activities: [
      Activity(
        imageUrl: 'assets/images/lounge.jpg',
        name: 'Skye Bar Rooftop Lounge',
        type: 'Restaurant',
        startTimes: ['11:00 am', '11:00 pm'],
        rating: 4,
        price: 1800,
        latitude: 9.04124859732543,
        longitude: 7.5257625242483615,
        infoLink: 'https://hotels.ng/places/lounges/1084-skye-bar-rooftop-lounge',
        directionsLink: 'https://www.openstreetmap.org/directions?engine=osrm_car&route=9.04124859732543,7.5257625242483615',
      ),
    ],
  ),
];
 // ];

  @override
  Widget build(BuildContext context) {
    final filteredDestinations = destinations.where((d) => d.city.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF0288D1),
        backgroundColor: Colors.grey[800],
        title: Text('City Guide: Your Abuja Guide',
        style: TextStyle(color: Colors.white, fontSize: 24,
        ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: CitySearchDelegate(destinations)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredDestinations.length,
        itemBuilder: (context, index) {
          final destination = filteredDestinations[index];
          final activity = destination.activities.first;

          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  destination.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                destination.city,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.country,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    activity.name,
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              onTap: () async {
                Navigator.of(context).pushNamed('/activity_details', arguments: activity);

                if (await canLaunchUrl(Uri.parse(activity.infoLink))) {
                  await launchUrl(Uri.parse(activity.infoLink));
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class CitySearchDelegate extends SearchDelegate {
  final List<Destination> destinations;

  CitySearchDelegate(this.destinations);

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredDestinations = destinations.where((d) => d.city.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: filteredDestinations.length,
      itemBuilder: (context, index) {
        final destination = filteredDestinations[index];
        return ListTile(
          leading: Image.asset(destination.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
          title: Text(destination.city),
          subtitle: Text(destination.country),
          onTap: () {
            Navigator.of(context).pushNamed('/activity_details', arguments: destination.activities.first);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(); 
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
}
