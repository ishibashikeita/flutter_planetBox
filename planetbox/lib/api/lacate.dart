import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:latlong2/latlong.dart' as latLng;
import 'package:geolocator/geolocator.dart';

Future backPosition() async {
  final ss = Geolocator.getCurrentPosition();
  return ss;
}

Future backpPlace() async {
  final ss = await Geolocator.getCurrentPosition();
  print(ss);

  print(geoCoding.placemarkFromCoordinates(ss.latitude, ss.longitude));
  // print(sb);
  // return sb;
}
