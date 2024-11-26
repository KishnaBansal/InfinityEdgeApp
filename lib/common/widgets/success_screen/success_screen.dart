import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/common/styles/spacing_styles.dart';
import 'package:infinity_edge_app/features/authentication/screens/login/login.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});
  final String image, title, subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //Image
              Lottie.asset(image, width: KHelperFunctions.screenWidth() * 0.6),

              const SizedBox(height: KSizes.spaceBtwSections),

              //title and subtitles
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: KSizes.spaceBtwItems),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: KSizes.spaceBtwSections),

              //buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(KTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
