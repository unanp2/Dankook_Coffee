import 'package:dankookcoffee/database/DatabaseHelper.dart';
import 'package:dankookcoffee/models/appbar.dart';
import 'package:dankookcoffee/models/black_button.dart';
import 'package:dankookcoffee/models/rating_button.dart';
import 'package:dankookcoffee/models/rev_black_button.dart';
import 'package:dankookcoffee/review/review.dart';
import 'package:dankookcoffee/review/review_page.dart';
import 'package:dankookcoffee/review/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewEditPage extends StatefulWidget {
  int review_id = 0;
  ReviewEditPage({required this.review_id});

  @override
  State<ReviewEditPage> createState() => _ReviewEditPageState();
}

class _ReviewEditPageState extends State<ReviewEditPage> {
  Rating rating = Rating(rating: 0);
  Content content = Content(content: '');
  TextEditingController contentController = TextEditingController();
  DatabaseHelper DBHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(),
        body: SingleChildScrollView(
          child: Container(
            width: 400,
            height: 720,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RatingButton(rating: rating),
                  SizedBox(
                    height: 10,
                  ),
                  Text("리뷰 작성",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: TextField(
                      controller: contentController,
                      decoration: InputDecoration(
                          labelText: '리뷰를 작성해 주세요.',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                      maxLines: null, // 여러 줄 입력 가능하도록 설정
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      content.content = contentController.text;
                      Review r = Review(
                          review_id: widget.review_id,
                          user_id: 1,
                          store_id: 1,
                          store_picture_url: '',
                          rating: rating.rating,
                          content: content.content,
                          created_date: '',
                          modified_date: '');
                      DBHelper.insertReview(r);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewPage()));
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
                ]),
          ),
        ));
  }
}
