import 'package:flutter/material.dart';
import '../../../../Core/Constant/Colors.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.only(top: 4, left: 30),
    height: 90,
    width: double.infinity,
    decoration: BoxDecoration(
        color:AppColor. bluePurpleM,
        borderRadius: BorderRadius.circular(20),
        gradient:const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.bluePurpleS,AppColor. bluePurpleM],
            stops:  [0.1, 1])),
    child: Banner(
       message: "20 % ",
      location: BannerLocation.topEnd,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:const [
            Text('A Summer surpries',
                style: TextStyle(
                  color:AppColor. white,
                  fontSize: 13,
                  fontFamily: 'muli',
                )),
            Text(
              'Cashback 20%',
              style: TextStyle(
                  color:AppColor. white,
                  fontSize: 25,
                  fontFamily: 'muli',
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    ));
  }
}
