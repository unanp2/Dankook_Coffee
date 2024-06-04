import 'package:flutter/material.dart';
import 'review_write.dart';


class Review {
  final String userId;
  final int starRating;
  final String reviewContent;
  final DateTime createdAt;

  Review({required this.userId, required this.starRating, required this.reviewContent, required this.createdAt});
}

class ReviewListPage extends StatelessWidget {

  // 가상의 리뷰 데이터
  final List<Review> reviews = [
    Review(userId: "Bruno Fernandes", starRating: 4, reviewContent: "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price", createdAt: DateTime(2024, 6, 4)),
    Review(userId: "Tracy Mosby", starRating: 5, reviewContent: "서비스도 좋고 음식도 맛있어요.", createdAt: DateTime(2024, 6, 3)),
    Review(userId: "Bruno Fernandes", starRating: 4, reviewContent: "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price", createdAt: DateTime(2024, 6, 4)),
    Review(userId: "Tracy Mosby", starRating: 5, reviewContent: "서비스도 좋고 음식도 맛있어요.", createdAt: DateTime(2024, 6, 3)),
    Review(userId: "Bruno Fernandes", starRating: 4, reviewContent: "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price", createdAt: DateTime(2024, 6, 4)),
    Review(userId: "Tracy Mosby", starRating: 5, reviewContent: "서비스도 좋고 음식도 맛있어요.", createdAt: DateTime(2024, 6, 3)),
    Review(userId: "Bruno Fernandes", starRating: 4, reviewContent: "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price", createdAt: DateTime(2024, 6, 4)),
    Review(userId: "Tracy Mosby", starRating: 5, reviewContent: "서비스도 좋고 음식도 맛있어요.", createdAt: DateTime(2024, 6, 3)),

  ];

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
          leading: IconButton( // 뒤로가기 아이콘 추가
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 현재 화면을 닫음
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/'); // 홈 화면으로 이동
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              left: 13,
              top: 20,
              child: Container(
                width: 100,
                height: 100,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200825_221%2F1598301965072uKUtO_JPEG%2F3619_20190130053056_tqra4.JPG"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            const Positioned(
              left: 130,
              top: 16,
              child: SizedBox(
                width: 343,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          '단국 커피',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 20,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 130,
              top: 60,
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 30),
                  SizedBox(width: 8),
                  Text(
                    '4.5', //평균점수 가져오기
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 24,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 130,
              top: 100,
              child: Text(
                '8 reviews', //평균리뷰 가져오기
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF303030),
                  fontSize: 18,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              bottom: 80,
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(review.userId, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                if (index < review.starRating) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  );
                                } else {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 20,
                                  );
                                }
                              }),
                            ),
                            Text('${review.createdAt.year}-${review.createdAt.month}-${review.createdAt.day}'),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Text(review.reviewContent),
                  );
                },
              ),
            ),],
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
