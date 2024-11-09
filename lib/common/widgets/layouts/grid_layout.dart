import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount, //display x products in total
      shrinkWrap: true,
      padding: EdgeInsets.zero, //remove any extra spacing
      physics: const NeverScrollableScrollPhysics(), //allow widget scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 in a row
        mainAxisSpacing: TSizes.gridViewSpacing, //for vertical
        crossAxisSpacing: TSizes.gridViewSpacing, //for horizontal
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
