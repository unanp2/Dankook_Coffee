import 'package:flutter/material.dart';

class reviewpage1 extends StatelessWidget {
  const reviewpage1({super.key});

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
                left: -12,
                top: 65,
                child: SizedBox(
                  width: 343,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const FlutterLogo(),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: SizedBox(
                          child: Text(
                            '단국 커피',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 16,
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
                left: 9,
                top: 187,
                child: SizedBox(
                  width: 343,
                  height: 498,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 196.41,
                        height: 141.27,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 1.14,
                              top: 34.15,
                              child: Opacity(
                                opacity: 0,
                                child: SizedBox(
                                  width: 195.27,
                                  height: 100.33,
                                  child: Stack(),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 34.54,
                              top: 8.02,
                              child: SizedBox(
                                width: 123.56,
                                height: 133.16,
                                child: Stack(),
                              ),
                            ),
                            Positioned(
                              left: 46.53,
                              top: 0,
                              child: SizedBox(
                                width: 25.71,
                                height: 29.15,
                                child: Stack(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '아직 아무런 리뷰도 없습니다.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 24,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: 277,
                        child: Text(
                          '리뷰를 작성하고 \n첫 리뷰의 주인공이 되어보세요!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 15,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: -0.15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -7,
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
                                    height: 0,
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
                                      image: NetworkImage(
                                          "https://via.placeholder.com/16x16"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 317,
                        top: 10,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/25x25"),
                              fit: BoxFit.fill,
                            ),
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
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
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
                                            height: 0,
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
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/16x16"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 317,
                                top: 10,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/25x25"),
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
                left: 0,
                top: -2,
                child: SizedBox(
                  width: 360,
                  height: 50,
                  child: Stack(
                    children: [
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
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
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
                                            height: 0,
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
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/16x16"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 317,
                                top: 10,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/25x25"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 8,
                        child: Container(
                          width: 29,
                          height: 29,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/29x29"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 13,
                top: 691,
                child: SizedBox(
                  width: 334,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 50,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(-1.57),
                          child: Container(
                            width: 50,
                            height: 334,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF232323),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
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
                        left: 107,
                        top: 12,
                        child: Text(
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
                      ),
                    ],
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
