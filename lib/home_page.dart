import 'package:dankookcoffee/login/login_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController; // PageView를 제어하기 위한 PageController
  int _currentPage = 1; // 현재 페이지를 저장하는 변수, 시작 페이지를 1로 설정
  final int _numPages = 8; // 총 페이지 수

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose(); // 페이지 컨트롤러 해제
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    if (page == 0) {
      Future.delayed(Duration(milliseconds: 300), () {
        _pageController.jumpToPage(_numPages);
      });
    } else if (page == _numPages + 1) {
      Future.delayed(Duration(milliseconds: 300), () {
        _pageController.jumpToPage(1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              width: 360,
              height: 800,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  // 상단 네비게이션 바
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.menu, color: Colors.black),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginHomePage()));
                            },
                          ),
                          Row(
                            children: [
                              Text(
                                'DANKOOK',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Black Han Sans',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none, // 노란색 줄 제거
                                ),
                              ),
                              SizedBox(width: 4,),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/logo_image.png'), // 경로 수정
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text(
                                'COFFEE',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Black Han Sans',
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none, // 노란색 줄 제거
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.shopping_cart, color: Colors.black),
                            onPressed: () {
                              // 쇼핑카트 네비게이션 로직 추가
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 광고 이미지를 위한 PageView
                  Positioned(
                    left: 0,
                    top: 50,
                    child: Container(
                      width: 360,
                      height: 360,
                      child: PageView(
                        controller: _pageController, // PageView를 제어하기 위한 컨트롤러
                        onPageChanged: _onPageChanged, // 페이지 변경 시 호출될 콜백 함수
                        children: List.generate(_numPages + 2, (index) {
                          if (index == 0) {
                            return Image.asset(
                                "assets/images/ad_image${_numPages - 1}.png",
                                fit: BoxFit.fill);
                          } else if (index == _numPages + 1) {
                            return Image.asset("assets/images/ad_image0.png",
                                fit: BoxFit.fill);
                          } else {
                            return Image.asset(
                                "assets/images/ad_image${index - 1}.png",
                                fit: BoxFit.fill);
                          }
                        }),
                      ),
                    ),
                  ),
                  // 페이지 인디케이터(점 표시)
                  Positioned(
                    left: 0,
                    top: 410,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_numPages, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index + 1 ? 12 : 8,
                          height: _currentPage == index + 1 ? 12 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index + 1
                                ? Colors.black
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                  // 사용자 정보 컨테이너
                  Positioned(
                    left: 21,
                    top: 463,
                    child: Container(
                      width: 319,
                      height: 186,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                  Positioned(
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
                          decoration: TextDecoration.none, // 노란색 줄 제거
                        ),
                      ),
                    ),
                  ),
                  // 하단 네비게이션 아이콘
                  Positioned(
                    left: 72,
                    top: 688,
                    child: Container(
                      width: 216,
                      height: 70, // 높이를 늘려서 글씨가 잘리지 않게 함
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildNavigationIcon(
                              context,
                              'assets/icons/coffee-shop 1.png',
                              '가게 정보',
                              '/store-info'),
                          _buildNavigationIcon(context,
                              'assets/icons/menu2 1.png', '메뉴', '/menu'),
                          _buildNavigationIcon(
                              context,
                              'assets/icons/credit-card 1.png',
                              '리뷰',
                              '/review'),
                          _buildNavigationIcon(
                              context,
                              'assets/icons/cup 1.png',
                              '커피 추천',
                              '/coffee-recommend'),
                        ],
                      ),
                    ),
                  ),
                  // 사용자 이름 및 쿠폰 정보
                  Positioned(
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
                              decoration: TextDecoration.none, // 노란색 줄 제거
                            ),
                          ),
                          TextSpan(
                            text: '님',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Goldman',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none, // 노란색 줄 제거
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
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
                        decoration: TextDecoration.none, // 노란색 줄 제거
                      ),
                    ),
                  ),
                  // 프로필 이미지
                  Positioned(
                    left: 34,
                    top: 487,
                    child: Container(
                      width: 147,
                      height: 147,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile_image.png"),
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
      ],
    );
  }

  // 네비게이션 아이콘 생성 메서드
  Widget _buildNavigationIcon(
      BuildContext context, String iconPath, String text, String route) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, route); // 아이콘 클릭 시 해당 경로로 네비게이트
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.asset(iconPath, fit: BoxFit.contain),
          ),
        ),
        SizedBox(height: 4),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Sunflower',
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none, // 노란색 줄 제거
          ),
        ),
      ],
    );
  }
}
