import 'package:flutter/material.dart';
import '../../../Core/Constant/Colors.dart';
import '../../../Core/Constant/ScreenSize.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod(
      {super.key,
      required this.paymentTitle,
      required this.onTap,
      required this.isActive});
  final String paymentTitle;
  final Function()? onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSize.screenWidth,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isActive == false ? AppColor.pink : AppColor.orange,
        ),
        child: Text(
          paymentTitle,
          style: isActive == false
              ? Theme.of(context).textTheme.caption!
              : Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
