import 'package:dankookcoffee/models/black_button.dart';
import 'package:dankookcoffee/models/rev_black_button.dart';
import 'package:dankookcoffee/review/review_edit_page.dart';
import 'package:dankookcoffee/review/tool.dart';
import 'package:flutter/material.dart';

class EmptyReview extends StatelessWidget {
  const EmptyReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 400,
        height: 720,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/rev_image1.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "아직 아무런 리뷰도 없습니다.",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "리뷰를 작성하고",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Text(
              "첫 리뷰의 주인공이 되어 보세요.",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            SizedBox(
              height: 270,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReviewEditPage(review_id: 0)));
              },
              child: Container(
                height: 56,
                width: 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black),
                child: Center(
                  child: Text(
                    "Write a review",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
