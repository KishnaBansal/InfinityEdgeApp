import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/app.dart';
import 'package:infinity_edge_app/common/styles/spacing_styles.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/form_divider.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/social_buttons.dart';
import 'package:infinity_edge_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:infinity_edge_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/signup.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo,title,subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                      dark ? KImages.lightAppLogo : KImages.darkAppLogo,
                    ),
                  ),
                  Text(KTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: KSizes.sm),
                  Text(KTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              //Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: KSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: KTexts.email,
                        ),
                      ),
                      const SizedBox(height: KSizes.spaceBtwInputFields),
                      //Password
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: KTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: KSizes.spaceBtwInputFields / 2),
                      //Remeber Me and Forget Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //remember me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              Text(KTexts.rememberMe),
                            ],
                          ),
                          //forget password
                          TextButton(
                            onPressed: () => Get.to(() => ForgetPasswordScreen()),
                            child: Text(KTexts.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: KSizes.spaceBtwSections),
                      //Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(KTexts.signIn),
                        ),
                      ),
                      const SizedBox(height: KSizes.spaceBtwItems),
                      //create account button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => SignUpScreen()),
                          child: Text(KTexts.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Divider
              KFormDivider(dividerText: KTexts.orSignInWith.capitalize!),
              const SizedBox(height: KSizes.spaceBtwSections),
              //Footer
              KSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}



