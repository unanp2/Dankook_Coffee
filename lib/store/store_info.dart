import 'package:flutter/material.dart';

class StoreInfoPage extends StatelessWidget {
  final storeData = [
    {
      "store_id": 1,
      "store_picture_url": "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200825_221%2F1598301965072uKUtO_JPEG%2F3619_20190130053056_tqra4.JPG",
      "store_name": "스타벅스 죽전단국대점",
      "store_address": "경기 용인시 수지구 죽전동 1335-1",
      "store_phone_number": "1522-3232",
      "latitude": 37.3243901,
      "longitude": 127.1248419,
      "rating_average": 0
    }
  ];

  @override
  Widget build(BuildContext context) {
    var store = storeData[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Info'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 360,
                height: 800,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 62,
                      child: Container(
                        width: 360,
                        height: 57,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 141,
                              top: 18,
                              child: Text(
                                '매장 정보',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 62,
                      child: Container(
                        width: 370,
                        height: 444,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(store["store_picture_url"] as String),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 503,
                      child: Container(
                        width: 360,
                        height: 297,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 177,
                              top: 21,
                              child: Text(
                                store["store_name"] as String,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Gowun Dodum',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 99,
                              top: 99,
                              child: Text(
                                store["store_address"] as String,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Gowun Dodum',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 147,
                              top: 179,
                              child: Text(
                                store["store_phone_number"] as String,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Gowun Dodum',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 158,
                              top: 249,
                              child: Text(
                                '07:00 ~ 22:00',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Gowun Dodum',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
