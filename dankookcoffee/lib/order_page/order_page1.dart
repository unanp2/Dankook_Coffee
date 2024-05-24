import 'package:flutter/material.dart';

class OrderPage1 extends StatelessWidget {
  const OrderPage1({super.key});

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
                    ],
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
                                  decoration: const BoxDecoration(
                                      color: Colors.white),
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
              const Positioned(
                left: 127,
                top: 71,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '스타벅스\n',
                        style: TextStyle(
                          color: Color(0xFF909090),
                          fontSize: 18,
                          fontFamily: 'Gelasio',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                        ),
                      ),
                      TextSpan(
                        text: '죽전단국대점',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 18,
                          fontFamily: 'Gelasio',
                          fontWeight: FontWeight.w700,
                          height: 0.08,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Positioned(
                left: 100,
                top: 190,
                child: Text(
                  '추천',
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 321,
                top: 84,
                child: Container(
                  width: 24,
                  padding: const EdgeInsets.only(top: 3, right: 1.50),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 84,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.only(
                    top: 2,
                    left: 2,
                    right: 1.69,
                    bottom: 1.69,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
              const Positioned(
                left: 169,
                top: 190,
                child: Text(
                  '푸드',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 234,
                top: 190,
                child: Text(
                  '음료',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 229,
                child: SizedBox(
                  width: 157,
                  height: 253,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 0,
                        top: 210,
                        child: Text(
                          '나이트로 바닐라 크림',
                          style: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        top: 234,
                        child: Text(
                          '5,500 원',
                          style: TextStyle(
                            color: Color(0xFF303030),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 157,
                          height: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 157,
                                  height: 200,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFC4C4C4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -12,
                                child: Container(
                                  width: 157,
                                  height: 236,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/157x236"),
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
                        left: 117,
                        top: 160,
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                            color: const Color(0x665F5F5F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                padding: const EdgeInsets.only(
                                  top: 2.67,
                                  left: 2,
                                  right: 2,
                                  bottom: 2,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [  ],
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
                left: 188,
                top: 229,
                child: SizedBox(
                  width: 157,
                  height: 272,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 2,
                        top: 210,
                        child: Text(
                          '돌체 콜드 브루',
                          style: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 2,
                        top: 234,
                        child: Text(
                          '4,500 원\n',
                          style: TextStyle(
                            color: Color(0xFF303030),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 157,
                          height: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 157,
                                  height: 200,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFC4C4C4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -18,
                                top: 0,
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/200x200"),
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
                        left: 117,
                        top: 160,
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                            color: const Color(0x665F5F5F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                padding: const EdgeInsets.only(
                                  top: 2.67,
                                  left: 2,
                                  right: 2,
                                  bottom: 2,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [],
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
                left: 188,
                top: 497,
                child: SizedBox(
                  width: 157,
                  height: 253,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 2,
                        top: 210,
                        child: Text(
                          '아이스 카라멜 마키아또',
                          style: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 2,
                        top: 234,
                        child: Text(
                          '4,500 원',
                          style: TextStyle(
                            color: Color(0xFF303030),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 157,
                          height: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 157,
                                  height: 200,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFC4C4C4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -18,
                                top: -20.30,
                                child: Container(
                                  width: 184.74,
                                  height: 230.30,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/185x230"),
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
                        left: 117,
                        top: 160,
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                            color: const Color(0x665F5F5F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                padding: const EdgeInsets.only(
                                  top: 2.67,
                                  left: 2,
                                  right: 2,
                                  bottom: 2,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [],
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
                left: 91,
                top: 141,
                child: SizedBox(
                  width: 254,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF303030),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              top: 12,
                              child: Container(
                                width: 20,
                                height: 20,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.47),
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 25),
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8,
                              top: 8,
                              child: Container(
                                width: 28,
                                height: 28,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/28x28"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 25),
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8,
                              top: 8,
                              child: Container(
                                width: 28,
                                height: 28,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://via.placeholder.com/28x28"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 497,
                child: SizedBox(
                  width: 157,
                  height: 253,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 157,
                          height: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 157,
                                  height: 200,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFC4C4C4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -16,
                                child: Container(
                                  width: 157,
                                  height: 231,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/157x231"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 117,
                                top: 160,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  padding: const EdgeInsets.all(5),
                                  decoration: ShapeDecoration(
                                    color: const Color(0x665F5F5F),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        padding: const EdgeInsets.only(
                                          top: 2.67,
                                          left: 2,
                                          right: 2,
                                          bottom: 2,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [],
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
                      const Positioned(
                        left: 0,
                        top: 210,
                        child: Text(
                          '리저브 콜드 브루',
                          style: TextStyle(
                            color: Color(0xFF5F5F5F),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        top: 234,
                        child: Text(
                          '3,000 원',
                          style: TextStyle(
                            color: Color(0xFF303030),
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w700,
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