import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View all',
    this.showActionButton = true,
    this.textColor,
    this.onPressed,
  });
  final String title, buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          if (showActionButton )
            TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
