import 'package:flutter/material.dart';
import 'package:planetbox/compass.dart';
import 'models/star.dart';

class starPage extends StatefulWidget {
  starPage({super.key, required this.star});

  Star star;

  @override
  State<starPage> createState() => _starPageState();
}

class _starPageState extends State<starPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.star.jpName + '(' + widget.star.enName + ')',
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(201, 242, 237, 237).withOpacity(0.1),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(widget.star.starImage),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.15,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(201, 242, 237, 237)
                                          .withOpacity(0.1),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '季節',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.star.season,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.15,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(201, 242, 237, 237)
                                          .withOpacity(0.1),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '方向',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.star.direction,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.15,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(201, 242, 237, 237)
                                          .withOpacity(0.1),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '高さ',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.star.altitude,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.25,
                    //color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(201, 242, 237, 237)
                                          .withOpacity(0.1),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '内容',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.15,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.star.content,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.6,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromARGB(201, 242, 237, 237)
                                          .withOpacity(0.1),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '星座の起源',
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                                width: size.width * 0.8,
                                height: size.height * 0.05,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                // color: Colors.white,
                                width: size.width * 0.8,
                                height: size.height * 0.4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.star.origin,
                                    style: TextStyle(
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Compass()),
                    );
                  },
                  child: Container(
                    width: size.width * 0.7,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(201, 242, 237, 237).withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'コンパス',
                          style: TextStyle(
                            fontSize: size.width * 0.1,
                            color: Color.fromARGB(201, 242, 237, 237),
                          ),
                        ),
                        Icon(
                          Icons.explore,
                          size: size.height * 0.1,
                          color: Color.fromARGB(201, 242, 237, 237),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                )
              ],
            ),
          ),
        ));
  }
}
