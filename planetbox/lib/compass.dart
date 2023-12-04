import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

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
              return Text(
                device.toString(),
                style: TextStyle(color: Colors.red, fontSize: 50),
              );
            }),
      ),
    );
  }
}
