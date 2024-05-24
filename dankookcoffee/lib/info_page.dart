import 'package:flutter/material.dart';


class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 800,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 62,
                child: SizedBox(
                  width: 360,
                  height: 57,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 360,
                          height: 57,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFBFBFB),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/370x444"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 503,
                child: SizedBox(
                  width: 360,
                  height: 297,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 360,
                          height: 74,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF979797)),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 177,
                        top: 21,
                        child: Text(
                          '단국 커피',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gowun Dodum',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 149,
                        child: Container(
                          width: 360,
                          height: 75,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF979797)),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 99,
                        top: 99,
                        child: Text(
                          '경기 용인시 수지구 죽전로 108-2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gowun Dodum',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 224,
                        child: Container(
                          width: 360,
                          height: 75,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF979797)),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 297,
                        child: Container(
                          width: 360,
                          height: 74,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF979797)),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 22,
                        top: 24,
                        child: Text(
                          '업체명',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gowun Dodum',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 14,
                        top: 249,
                        child: Text(
                          '이용시간',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gowun Dodum',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 28,
                        top: 99,
                        child: Text(
                          '주소',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gowun Dodum',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 28,
                        top: 179,
                        child: Text(
                          '전화',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gowun Dodum',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 147,
                        top: 179,
                        child: Text(
                          '031 -  080 - 8312',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Gowun Dodum',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Positioned(
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 7,
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
                      Positioned(
                        left: 317,
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
                        left: 0,
                        top: 8,
                        child: Container(
                          width: 29,
                          height: 29,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/29x29"),
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
                left: 223,
                top: 363,
                child: Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
