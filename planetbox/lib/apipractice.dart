import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:planetbox/const/starconst.dart';
import 'api/fetchStar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'api/fetchCountry.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'starpage.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'api/lacate.dart';
import 'models/country.dart';

import 'dart:math';

class api extends StatefulWidget {
  api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  late Position position;
  Timer? _timer;

  Map<String, dynamic> s = {};
  String url = '';
  int count = 0;
  Future? starlist;
  List current = [];
  String locate = '';
  Future<Position> posi = Geolocator.getCurrentPosition();

  String now = '';
  @override
  void initState() {
    super.initState();

    Future(
      () async {
        LocationPermission permission;
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }

        // final position = await Geolocator.getCurrentPosition();
        // final placeMarks = await geoCoding.placemarkFromCoordinates(
        //     position.latitude, position.longitude);
        // current.add(position.latitude.toDouble());
        // current.add(position.longitude.toDouble());

        // locate = (placeMarks[0].administrativeArea.toString() +
        //     placeMarks[0].locality.toString() +
        //     placeMarks[0].name.toString());
        Position sss = await backPosition();
        print(sss);
        now = DateFormat('yyyy年MM月d日H時mm分').format(DateTime.now()).toString();

        starlist = fetchstar_current(
          //経度
          sss.latitude,
          //緯度
          sss.longitude,
          //日付
          DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
          //時間
          DateFormat('HH').format(DateTime.now()).toString(),
          //分
          DateFormat('mm').format(DateTime.now()).toString(),
        );
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {});
      },
    );

    //_timer = Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    String new_time = DateFormat('yyyy年MM月d日H時mm分').format(DateTime.now());
    setState(() => {
          now = new_time,
        });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: size.width * 1.0,
              height: size.height * 1.0,
              color: Color.lerp(
                  Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color.fromARGB(201, 242, 237, 237),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.07,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    '現在地:',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.6,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  child: FutureBuilder(
                                      future: backpPlace(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          final ss = snapshot.data!;

                                          return Text(
                                            ss[0]
                                                    .administrativeArea
                                                    .toString() +
                                                ss[0].locality.toString() +
                                                ss[0].name.toString(),
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  201, 242, 237, 237),
                                            ),
                                          );
                                        }
                                        return Text('');
                                      }),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.07,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    '現在時刻:',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.6,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  child: Text(
                                    now,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  // color: Colors.black,
                  child: FutureBuilder(
                      future: posi,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return FractionallySizedBox(
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(201, 242, 237, 237),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          final positions = snapshot.data!;
                          return FlutterMap(
                            options: MapOptions(
                              initialCenter: latLng.LatLng(
                                  positions.latitude, positions.longitude),
                              initialZoom: 18.0,
                              maxZoom: 20.0,
                              minZoom: 3.0,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c'],
                                retinaMode: true,
                              ),
                              MarkerLayer(markers: [
                                Marker(
                                  point: latLng.LatLng(
                                      positions.latitude, positions.longitude),
                                  child: Icon(
                                    Icons.location_on_rounded,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                )
                              ])
                            ],
                          );
                        }
                        return Container();
                      }),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '今見れる星座一覧',
                        style: TextStyle(
                          color: Color.fromARGB(201, 242, 237, 237),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.width * 0.5,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color:
                            Color.fromARGB(201, 242, 237, 237).withOpacity(0.1),
                      ),
                    ),
                  ),
                  //color: Colors.red,
                  child: FutureBuilder(
                      future: starlist,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List stars = snapshot.data!;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: stars.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => starPage(
                                              star: stars[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: size.width * 0.4,
                                        height: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                    201, 242, 237, 237)
                                                .withOpacity(0.1),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                stars[index].starImage),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      stars[index].jpName,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(201, 242, 237, 237),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return Container();
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class api2 extends StatefulWidget {
  api2({super.key});

  @override
  State<api2> createState() => _apiState2();
}

class _apiState2 extends State<api2> {
  late Position position;
  Timer? _timer;

  Map<String, dynamic> s = {};
  String url = '';
  int count = 0;
  Future? starlist;
  List current = [];
  String locate = '';
  Future<Position> posi = Geolocator.getCurrentPosition();
  String country = '';
  double lat = 0;
  double lon = 0;
  late Future countryClass;
  String flag = "";
  String now = '';
  String capitals = '';
  int population = 0;
  CountryClass? fav;
  @override
  void initState() {
    super.initState();

    int intRand = Random().nextInt(249);
    if (apiList[intRand]['name']['common'] != null ||
        apiList[intRand]['translations']['jpn']['official'] != null ||
        apiList[intRand]['capitalInfo']['latlng'] != null ||
        apiList[intRand]['flags']['png'] != null ||
        apiList[intRand]['capital'] != null ||
        apiList[intRand]['population'] != null) {
      CountryClass res = CountryClass(
          apiList[intRand]['name']['common'],
          apiList[intRand]['translations']['jpn']['official'],
          apiList[intRand]['capitalInfo']['latlng'],
          apiList[intRand]['flags']['png'],
          apiList[intRand]['capital'],
          apiList[intRand]['population']);
      country = (res.name + '(' + res.cname + ')');

      fav = res;

      lat = res.latlng[0];
      lon = res.latlng[1];
      flag = res.flag;
      capitals = res.capital[0];
      population = res.population;

      now = DateFormat('yyyy年MM月d日H時mm分').format(DateTime.now()).toString();
      starlist = fetchstar_current(
        //経度
        lat,
        //緯度
        lon,
        //日付
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
        //時間
        DateFormat('HH').format(DateTime.now()).toString(),
        //分
        DateFormat('mm').format(DateTime.now()).toString(),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: size.width * 1.0,
              height: size.height * 1.0,
              color: Color.lerp(
                  Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color.fromARGB(201, 242, 237, 237),
                            ),
                          ),
                          Container(
                            width: size.width * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    favorite.add({fav!.name.toString(): fav});
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Color.fromARGB(201, 242, 237, 237),
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.menu,
                                    color: Color.fromARGB(201, 242, 237, 237),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.07,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    '場所:',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.6,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  child: Text(
                                    country,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.07,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    '首都:',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  child: Text(
                                    capitals,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    '人口:',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.06,
                                child: FittedBox(
                                  child: Text(
                                    NumberFormat("#,###")
                                            .format(population)
                                            .toString() +
                                        '人',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.4,
                      // color: Colors.black,
                      child: (lat != 0 || lon != 0)
                          ? FlutterMap(
                              options: MapOptions(
                                initialCenter: latLng.LatLng(
                                  lat,
                                  lon,
                                ),
                                initialZoom: 5.0,
                                maxZoom: 12.0,
                                minZoom: 3.0,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  retinaMode: true,
                                ),
                                MarkerLayer(markers: [
                                  Marker(
                                    point: latLng.LatLng(
                                      lat,
                                      lon,
                                    ),
                                    child: Icon(
                                      Icons.location_on_rounded,
                                      size: 50,
                                      color: Colors.red,
                                    ),
                                  )
                                ])
                              ],
                            )
                          : FractionallySizedBox(
                              widthFactor: 0.5,
                              heightFactor: 0.5,
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(201, 242, 237, 237),
                              ),
                            ),
                    ),
                    Align(
                      alignment: Alignment(-1.0, 0.1),
                      child: (flag != "")
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(flag),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '今見れる星座一覧',
                        style: TextStyle(
                          color: Color.fromARGB(201, 242, 237, 237),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.width * 0.5,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color:
                            Color.fromARGB(201, 242, 237, 237).withOpacity(0.1),
                      ),
                    ),
                  ),
                  //color: Colors.red,
                  child: FutureBuilder(
                      future: starlist,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List stars = snapshot.data!;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: stars.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => starPage(
                                              star: stars[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: size.width * 0.4,
                                        height: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                    201, 242, 237, 237)
                                                .withOpacity(0.1),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                stars[index].starImage),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      stars[index].jpName,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(201, 242, 237, 237),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return Container();
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
