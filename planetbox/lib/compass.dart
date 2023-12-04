import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class Compass extends StatefulWidget {
  const Compass({super.key});

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  late double? device;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'コンパス',
          style: TextStyle(
            color: Color.fromARGB(201, 242, 237, 237),
          ),
        ),
        backgroundColor:
            Color.lerp(Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
        iconTheme: IconThemeData(
          color: Color.fromARGB(201, 242, 237, 237),
        ),
      ),
      backgroundColor:
          Color.lerp(Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
      body: Center(
        child: StreamBuilder(
            stream: FlutterCompass.events,
            builder: (context, snapshot) {
              device = snapshot.data?.heading;
              if (snapshot.hasError) {
                return Text('Error reading heading: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Center(
                child: Transform.rotate(
                  angle: (device! * (math.pi / 180) * -1),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
