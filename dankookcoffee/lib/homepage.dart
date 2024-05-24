import 'package:flutter/material.dart';
import 'info_page.dart';
import 'order_page/order_page1.dart';
import 'review_page/reiew_page1.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: const [
            FigmaGeneratedWidget(), // Fixed the missing widget reference
          ],
        ),
      ),
    );
  }
}

// Fixed the class name to provide a name
class FigmaGeneratedWidget extends StatelessWidget {
  const FigmaGeneratedWidget ({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 50,
                child: Container(
                  width: 360,
                  height: 360,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/360x360"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 463,
                child: Container(
                  width: 319,
                  height: 186,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 183,
                top: 533,
                child: SizedBox(
                  width: 109,
                  height: 31,
                  child: Text(
                    '등급 : GOLD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Jua',
                      fontWeight: FontWeight.w400,
                      height: 1.0, // Fixed the height
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 72,
                top: 688,
                child: SizedBox(
                  width: 216,
                  height: 55,
                  child: Stack(
                    children: [
                      //가계 정보
                      Positioned(
                        left: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const StoreInfoWidget()),
                            );
                          },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/a.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        ),
                      ),
                      //메뉴
                      Positioned(
                        left: 57,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const OrderPage1()),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/b.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //리뷰
                      Positioned(
                        left: 118,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const reviewpage1()),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/c.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //커피추천
                      Positioned(
                        left: 173,
                        top: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/40x40"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        top: 40,
                        child: Text(
                          '가게 정보',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Sunflower',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Fixed the height
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 69,
                        top: 40,
                        child: Text(
                          '메뉴',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Sunflower',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Fixed the height
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 126,
                        top: 40,
                        child: Text(
                          '리뷰',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Sunflower',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Fixed the height
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 170,
                        top: 40,
                        child: Text(
                          '커피 추천',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Sunflower',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Fixed the height
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 186,
                top: 487,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '김단국 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Goldman',
                          fontWeight: FontWeight.w700,
                          height: 1.0, // Fixed the height
                        ),
                      ),
                      TextSpan(
                        text: '님',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Goldman',
                          fontWeight: FontWeight.w700,
                          height: 1.0, // Fixed the height
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Positioned(
                left: 190,
                top: 561,
                child: Text(
                  '쿠폰 : 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Jua',
                    fontWeight: FontWeight.w400,
                    height: 1.0, // Fixed the height
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: SizedBox(
                  width: 360,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 360,
                          height: 50,
                          decoration: const BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 10,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/25x25"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 81,
                        top: 17,
                        child: SizedBox(
                          width: 198,
                          height: 25,
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'DANKOOK   COFFEE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Black Han Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 1.0, // Fixed the height
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 105,
                                top: 2,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://via.placeholder.com/16x16"),
                                      fit: BoxFit.fill,
                                    ),
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
              ),
              Positioned(
                left: 34,
                top: 487,
                child: Container(
                  width: 147,
                  height: 147,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/147x147"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
