import 'package:dankookcoffee/models/appbar.dart';
import 'package:flutter/material.dart';

class StoreInfoPage extends StatelessWidget {
  final storeData = [
    {
      "store_id": 1,
      "store_picture_url":
          "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200825_221%2F1598301965072uKUtO_JPEG%2F3619_20190130053056_tqra4.JPG",
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
      appBar: appbar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 390,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(store["store_picture_url"] as String),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              width: 400,
              height: 82,
              child: Center(
                  child: Text(
                store["store_name"] as String,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              width: 400,
              height: 82,
              child: Center(
                  child: Text(
                store["store_address"] as String,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              width: 400,
              height: 82,
              child: Center(
                  child: Text(
                store["store_phone_number"] as String,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              width: 400,
              height: 82,
              child: Center(
                  child: Text(
                "07:00 ~ 22:00",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
