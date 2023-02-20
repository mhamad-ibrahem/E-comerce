import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/fonts.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    Key? key,
    required this.onIncrease,
    required this.onDecrease,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
    required this.categoty,
  }) : super(key: key);
  final String image;
  final String title;
  final String price;
  final String quantity;
  final String categoty;
  final void Function()? onIncrease;
  final void Function()? onDecrease;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 6,
      child: Dismissible(
        background: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.lightPink,
          ),
          child: const Icon(
            Icons.delete_outline_outlined,
            color: AppColor.red,
            size: 30,
          ),
        ),
        key: UniqueKey(),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 120,
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(12)),
                  color: AppColor.lightGrey),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.scaleDown,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: smallerBlackTextStyle(),
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  categoty,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.fade,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\n\$ $price ',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 35,
                        top: 15,
                      ),
                      alignment: Alignment.bottomRight,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: onIncrease,
                              icon: const Icon(
                                Icons.add,
                                color: AppColor.black,
                                size: 12,
                              )),
                          Text(
                            quantity,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: AppColor.black),
                          ),
                          IconButton(
                              onPressed: onDecrease,
                              icon: const Icon(
                                Icons.remove,
                                color: AppColor.black,
                                size: 12,
                              )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
