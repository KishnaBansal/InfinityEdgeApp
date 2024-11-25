import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KTermsAndConditionsCheckbox extends StatelessWidget {
  const KTermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${KTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${KTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark ? KColors.light : KColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? KColors.light : KColors.primary,
                    ),
              ),
              TextSpan(
                text: '${KTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${KTexts.termsOfUse}',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark ? KColors.light : KColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? KColors.light : KColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
