import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const[
          SpecialOpacityContainer(
            title: 'Smartphone',
            subtitle: '18 Brands',
            image: AppImageAsset.bannerimage1 ,
          ),
          SizedBox(width: 10),
          SpecialOpacityContainer(
              title: 'Fashion',
              subtitle: '24 Brands',
              image: AppImageAsset.bannerimage2 )
        ],
      ),
    );
  }
}

class SpecialOpacityContainer extends StatelessWidget {
  const SpecialOpacityContainer({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 17, left: 20),
            height: 100,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [AppColor.black.withOpacity(0.4),AppColor. white.withOpacity(0.2)],
                  stops: const [0.0003, 1]),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 20,
                      fontFamily: 'muli',
                      fontWeight: FontWeight.w900),
                ),
                Text(subtitle,
                    style: const TextStyle(
                        color:AppColor. white,
                        fontSize: 15,
                        fontFamily: 'muli',
                        fontWeight: FontWeight.bold))
              ],
            )),
      ],
    );
  }
}
