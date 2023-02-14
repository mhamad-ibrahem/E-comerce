
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../Core/Constant/Colors.dart';
import '../../../Core/Constant/ScreenSize.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody(
      {super.key,
      required this.name,
      required this.iamge,
      required this.rate,
      required this.price,
      required this.onDelete,
      required this.onDismissed,
      });
  final String name;
  final String iamge;
  final String rate;
  final String price;
  final VoidCallback onDelete;
 final void Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      background: Container(
        height: 100,
        padding: EdgeInsets.only(left: AppSize.screenWidth / 1.7),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.lightGrey),
            child: CachedNetworkImage(
              imageUrl:
                  iamge,
              fit: BoxFit.scaleDown,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               name,
                maxLines: 2,
                style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.bold),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Rate : $rate",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Icon(
                    Icons.star,
                    color: AppColor.yellow,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: AppSize.screenWidth * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$price \$",
                      style: const TextStyle(
                          color: AppColor.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: onDelete,
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: AppColor.deepOrange,
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
