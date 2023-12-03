import 'package:flutter/material.dart';
import 'package:planetbox/apipractice.dart';
import 'package:planetbox/const/starconst.dart';
import 'package:planetbox/models/country.dart';

class favoriteSelect extends StatefulWidget {
  favoriteSelect({super.key, required this.indexed});
  int indexed;

  @override
  State<favoriteSelect> createState() => _favoriteSelectState();
}

class _favoriteSelectState extends State<favoriteSelect> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          Color.lerp(Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
      appBar: AppBar(
        title: Text(
          'お気に入りリスト',
          style: TextStyle(color: Color.fromARGB(201, 242, 237, 237)),
        ),
        backgroundColor:
            Color.lerp(Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
        iconTheme: IconThemeData(
          color: Color.fromARGB(201, 242, 237, 237),
        ),
      ),
      body: Column(children: [
        (favorite.isEmpty)
            ? Container(
                width: size.width,
                height: size.height * 0.8,
                child: Center(
                  child: Text(
                    'お気に入りは登録されていません。',
                    style: TextStyle(
                      color: Color.fromARGB(201, 242, 237, 237),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: favorite.length,
                    itemBuilder: (context, index) {
                      CountryClass? _cnt;
                      int keyList = 0;
                      final _map = favorite[index];
                      _map.forEach((key, value) {
                        _cnt = value;
                        keyList = key;
                      });

                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(201, 242, 237, 237)
                                  .withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: size.width * 0.5,
                                  child: Text(
                                    _cnt!.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(201, 242, 237, 237),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                    width: size.width * 0.3,
                                    height: size.width * 0.15,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                            width: size.width * 0.1,
                                            child: Image.network(_cnt!.flag)),
                                        IconButton(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => api3(
                                                    cnt: _cnt!,
                                                    indexed: widget.indexed,
                                                    keylist: keyList,
                                                  ),
                                                ),
                                              );
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.open_in_new,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  201, 242, 237, 237),
                                            )),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ]),
    );
  }
}
