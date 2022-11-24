import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 17, left: 30),
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
            color: bluePurpleM,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [bluePurpleS, bluePurpleM],
                stops: const [0.1, 1])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('A Summer surpries',
                style: TextStyle(
                  color: white,
                  fontSize: 13,
                  fontFamily: 'muli',
                )),
            Text(
              'Cashback 20%',
              style: TextStyle(
                  color: white,
                  fontSize: 25,
                  fontFamily: 'muli',
                  fontWeight: FontWeight.w900),
            )
          ],
        ));
  }
}
