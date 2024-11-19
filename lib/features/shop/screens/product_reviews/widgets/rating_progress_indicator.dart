import 'package:flutter/material.dart';
import 'package:infinity_edge_app/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class KOverallProductRating extends StatelessWidget {
  const KOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3, //Assuming total flex is 10
          child: Text(
            "4.8",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              KRatingProgressIndicator(text: '5',value: 1.0),
              KRatingProgressIndicator(text: '4',value: 0.8),
              KRatingProgressIndicator(text: '3',value: 0.4),
              KRatingProgressIndicator(text: '2',value: 0.6),
              KRatingProgressIndicator(text: '1',value: 0.1),
            ],
          ),
        ),
      ],
    );
  }
}