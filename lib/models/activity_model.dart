class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;
  double latitude; 
  double longitude;
  String infoLink;
  String directionsLink;


  Activity({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.startTimes,
    required this.rating,
    required this.price,
    required this.latitude, 
    required this.longitude,
    required this.infoLink, // updated the name to be more descriptive
    required this.directionsLink,
  });
}
