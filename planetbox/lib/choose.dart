import 'package:flutter/material.dart';
import 'package:planetbox/apipractice.dart';
import 'apipractice.dart';

class choose extends StatefulWidget {
  const choose({super.key});

  @override
  State<choose> createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '星空を選ぼう',
          style: TextStyle(
            color: Color.fromARGB(201, 242, 237, 237),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(201, 242, 237, 237),
        ),
        backgroundColor:
            Color.lerp(Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
      ),
      backgroundColor:
          Color.lerp(Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.2,
            child: Center(
              child: Text(
                '見たい星空はどちらですか？',
                style: TextStyle(
                  color: Color.fromARGB(201, 242, 237, 237),
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => api(),
                        ),
                      );
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color.fromARGB(201, 242, 237, 237)
                              .withOpacity(0.1),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Color.fromARGB(201, 242, 237, 237)
                                .withOpacity(0.5),
                            size: size.height * 0.1,
                          ),
                          Text(
                            '現在地の星空を見る',
                            style: TextStyle(
                              color: Color.fromARGB(201, 242, 237, 237),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => api2(),
                        ),
                      );
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color.fromARGB(201, 242, 237, 237)
                              .withOpacity(0.1),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.language,
                            size: size.height * 0.1,
                            color: Color.fromARGB(201, 242, 237, 237)
                                .withOpacity(0.5),
                          ),
                          Text(
                            '世界の星空を見る',
                            style: TextStyle(
                              color: Color.fromARGB(201, 242, 237, 237),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.2,
            child: Center(
              child: Text(
                '今日の気分を選んでみよう！',
                style: TextStyle(
                  color: Color.fromARGB(201, 242, 237, 237),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
