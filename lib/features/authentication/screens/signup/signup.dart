import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/form_divider.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/social_buttons.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/verify_email.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            KSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(KTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: KSizes.spaceBtwSections),
              //Form
              KSignUpForm(),
              //Divider
              const SizedBox(height: KSizes.spaceBtwSections),
              KFormDivider(dividerText: KTexts.orSignUpWith),
              //Social Buttons
              const SizedBox(height: KSizes.spaceBtwSections),
              KSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
