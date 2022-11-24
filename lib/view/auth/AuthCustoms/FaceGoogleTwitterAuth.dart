import 'package:flutter/material.dart';

class FaceGoogleTwitterAuth extends StatelessWidget {
  const FaceGoogleTwitterAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/googleLogo.png'),
          Image.asset('assets/images/faceBookLogo.png'),
          Image.asset('assets/images/twitterLogo.png')
        ],
      ),
    );
  }
}
