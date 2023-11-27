import 'package:http/http.dart' as http;

import 'package:planetbox/const/starconst.dart';
import 'dart:math';
import "dart:convert";
import 'package:planetbox/models/country.dart';
import 'package:planetbox/const/starconst.dart';

Future fetchContry() async {
  int intRand = Random().nextInt(249);
  final res = await http.get(
    Uri.parse('https://restcountries.com/v3.1/all'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (res.statusCode == 200) {
    print(res.body.length);
    Map map = jsonDecode(utf8.decode(res.bodyBytes))[intRand];
    print(map);
  }
}

// Future fetchContr2() async {
//   int intRand = Random().nextInt(200);
//   String name = '';

//   final res = await http.get(
//     Uri.parse('https://restcountries.com/v3.1/all'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );

//   if (res.statusCode == 200) {
//     final Map<String, dynamic> rebm =
//         await jsonDecode(utf8.decode(res.bodyBytes))[intRand];

//     if (rebm['translations']['jpn'] == null || rebm['capitalInfo'] == null) {
//       fetchContr2();
//     } else {
//       CountryClass cnt = CountryClass(
//           rebm['name']['common'],
//           rebm['translations']['jpn']['official'],
//           rebm['capitalInfo']['latlng'],
//           rebm['flags']['png']);

//       return cnt;
//     }
//   }
//   if (res.statusCode == 404) {
//     fetchContr2();
//   }
// }

Future fetchContry3() async {
  if (apiList.isEmpty) {
    final res = await http.get(
      Uri.parse('https://restcountries.com/v3.1/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      print('fecth!!!');
      apiList = await jsonDecode(utf8.decode(res.bodyBytes));

      // if (rebm['translations']['jpn'] == null || rebm['capitalInfo'] == null) {
      //   fetchContr2();
      // } else {
      //   CountryClass cnt = CountryClass(
      //       rebm['name']['common'],
      //       rebm['translations']['jpn']['official'],
      //       rebm['capitalInfo']['latlng'],
      //       rebm['flags']['png']);

      //   return cnt;
      // }
    }
  }
}
