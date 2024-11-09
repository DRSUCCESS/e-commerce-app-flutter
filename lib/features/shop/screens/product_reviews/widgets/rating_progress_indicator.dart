import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              const TRatingProgressIndicator(text: '5', value: 1),
              const TRatingProgressIndicator(text: '4', value: .8),
              const TRatingProgressIndicator(text: '3', value: .6),
              const TRatingProgressIndicator(text: '2', value: .4),
              const TRatingProgressIndicator(text: '1', value: .2),
            ],
          ),
        ),
      ],
    );
  }
}