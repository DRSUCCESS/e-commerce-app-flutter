import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => CartScreen()),
            icon: Icon(Iconsax.shopping_bag)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: iconColor, fontSizeFactor: .8),
              ),
            ),
          ),
        )
      ],
    );
  }
}