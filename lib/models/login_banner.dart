import 'package:flutter/material.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 110,
                height: 1,
                color: Colors.grey,
              ),
            ),
            Text("Or Login with"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 115,
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                print('이동');
              },
              child: Container(
                width: 105,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Color.fromARGB(255, 187, 187, 187), width: 1)),
                child: Center(
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/facebook_ic.png'))),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15,),
            GestureDetector(
              onTap: () {
                print('이동');
              },
              child: Container(
                width: 105,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Color.fromARGB(255, 187, 187, 187), width: 1)),
                child: Center(
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/google_ic.png'))),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15,),
            GestureDetector(
              onTap: () {
                print('이동');
              },
              child: Container(
                width: 105,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Color.fromARGB(255, 187, 187, 187), width: 1)),
                child: Center(
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/apple_ic.png'))),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
