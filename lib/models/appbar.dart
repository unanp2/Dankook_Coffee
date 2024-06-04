import 'package:dankookcoffee/home_page.dart';
import 'package:flutter/material.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          SizedBox(
            width: 22,
          ),
          Text(
            'DANKOOK ',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo_image.png'),
                    fit: BoxFit.cover)),
          ),
          Text(
            ' COFFEE',
            style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
          ),
          SizedBox(
            width: 32,
          ),
          Container(
              width: 22,
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
              ))
        ],
      ),
    );
  }
}
