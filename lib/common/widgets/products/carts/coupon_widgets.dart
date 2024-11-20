import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KCouponCode extends StatelessWidget {
  const KCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return KRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? KColors.dark : KColors.white,
      padding: EdgeInsets.only(
        bottom: KSizes.sm,
        right: KSizes.sm,
        top: KSizes.sm,
        left: KSizes.md,
      ),
      child: Row(
        children: [
          /// Text Field
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Have a PromoCode? Enter Here!",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
    
          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Apply"),
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? KColors.white.withOpacity(0.5)
                    : KColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}