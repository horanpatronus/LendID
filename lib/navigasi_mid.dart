import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homepage/search.dart';

bool isMember = false;

class NavigasiMid extends StatelessWidget {
  const NavigasiMid({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.9),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              //pergi ke halaman top up
              builder: (context) => SearchButton(),
            ),
          );
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff005555),
            border: Border.all(
              color: Colors.white,
              width: 5.0,
            ),
          ),
          child: Icon(
            isMember ? Icons.add : Icons.search_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
    //end search button
  }
}
