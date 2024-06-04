import 'package:flutter/material.dart';
import 'review_write.dart';

void main() {
  runApp(const ReviewEmpty());
}

class ReviewEmpty extends StatelessWidget {
  const ReviewEmpty({super.key}); // Ensure const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review Write',
      theme: ThemeData(),
      home: const ReviewEmptyPage(),
    );
  }
}

class ReviewEmptyPage extends StatelessWidget {
  const ReviewEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '가계 리뷰',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DANKOOK COFFEE'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/'); // 홈 화면으로 이동
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/empty.png'),
              const SizedBox(height: 16),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  '아직 아무런 리뷰도 없습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 24,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    letterSpacing: -0.24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 277,
                child: Text(
                  '리뷰를 작성하고 \n첫 리뷰의 주인공이 되어보세요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 15,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                    letterSpacing: -0.15,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReviewWritePage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(0),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const SizedBox(
              width: 360,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Text(
                    'Write a review',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
