import 'package:city_guide_ui/models/activity_model.dart';
class Destination {
  String imageUrl;
  String city;
  String country;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.activities,
  });
}
