import 'dart:convert';
import 'package:planetbox/models/star.dart';
import 'package:planetbox/const/starconst.dart';
import 'package:http/http.dart' as http;

Future fetchstar(int id) async {
  final res = await http.get(
    Uri.parse(
      starApiRoute +
          'lat=35.6581&lng=139.7414&date=2020-01-15&hour=20&min=00&id=' +
          id.toString() +
          '',
    ),
  );

  if (res.statusCode == 200) {
    print(res.body);
    return Star.fromJson(jsonDecode(res.body));
  }
}

Future fetchstar_current(
    double lat, double lang, String date, String hour, String min) async {
  final res = await http.get(
    Uri.parse(starApiRoute +
        'lat=' +
        lat.toString() +
        '&lng=' +
        lang.toString() +
        '&date=' +
        date +
        '&hour=' +
        hour +
        '&min=' +
        min),
  );

  if (res.statusCode == 200) {
    Map<String, dynamic> resposbody = jsonDecode(res.body);
    final List resb = resposbody['result'];
    final List<Star> starAll = resb
        .map(
          (e) => Star.fromJson(e),
        )
        .toList();
    return starAll;
    // final starAll = resb.map((e) => Set.fromJson(e)).toList();
    // print(res.body);
    // return Star.fromJson(jsonDecode(res.body));
  }
}
