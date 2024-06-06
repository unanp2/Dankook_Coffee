import 'package:dankookcoffee/database/DatabaseHelper.dart';
import 'package:dankookcoffee/review/review.dart';
import 'package:dankookcoffee/review/tool.dart';

import '../login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewBlackButton extends StatelessWidget {
  DatabaseHelper DBHelper = DatabaseHelper();
  int review_id = 0;
  Rating rating = Rating(rating: 0);
  Content content = Content(content: '');
  String button_text;
  Widget button_page;
  ReviewBlackButton(
      {required this.review_id,
      required this.button_text,
      required this.button_page,
      required this.rating,
      required this.content});

  @override
  Widget build(BuildContext context) {
    Review rev = Review(
        review_id: review_id,
        user_id: 1,
        store_id: 1,
        store_picture_url: '',
        rating: rating.rating,
        content: content.content,
        created_date: '',
        modified_date: '');

    return GestureDetector(
      onTap: () {
        DBHelper.insertReview(rev);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => button_page));
      },
      child: Container(
        height: 56,
        width: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        child: Center(
          child: Text(
            button_text,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
