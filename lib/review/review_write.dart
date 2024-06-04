import 'package:flutter/material.dart';



class ReviewWritePage extends StatefulWidget {
  const ReviewWritePage({super.key});

  @override
  _ReviewWritePageState createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  void _submitReview() {
    // 리뷰를 서버나, db에 전송하는 로직 필요함
    print('별점: $_rating, 리뷰: ${_reviewController.text}');
    // 리뷰를 서버에 보낸 후 성공적으로 보냈다는 메시지를 출력함
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('리뷰가 성공적으로 등록되었습니다.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 1 ? Colors.orange : Colors.grey),
                      onPressed: () {
                        setState(() {
                          _rating = 1;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 2 ? Colors.orange : Colors.grey),
                      onPressed: () {
                        setState(() {
                          _rating = 2;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 3 ? Colors.orange : Colors.grey),
                      onPressed: () {
                        setState(() {
                          _rating = 3;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 4 ? Colors.orange : Colors.grey),
                      onPressed: () {
                        setState(() {
                          _rating = 4;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 5 ? Colors.orange : Colors.grey),
                      onPressed: () {
                        setState(() {
                          _rating = 5;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  child: TextField(
                    controller: _reviewController,
                    decoration: const InputDecoration(
                      hintText: '리뷰를 작성해주세요',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 8,
                    maxLength: 500,
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 167,
            bottom: 30,
            child: GestureDetector(
              onTap: _submitReview,
              child: SizedBox(
                width: 360,
                height: 50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 50,
                      child: Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                        child: Container(
                          width: 50,
                          height: 334,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF232323),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F303030),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 100,
                      top: 15,
                      child: Text(
                        'Register a review',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
