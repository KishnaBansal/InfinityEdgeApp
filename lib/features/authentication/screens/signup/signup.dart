import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/form_divider.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/social_buttons.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/verify_email.dart';
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
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                              labelText: KTexts.firstName,
                              prefixIcon: Icon(
                                Iconsax.user,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: KSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                              labelText: KTexts.lastName,
                              prefixIcon: Icon(
                                Iconsax.user,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Username
                    const SizedBox(height: KSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: KTexts.username,
                          prefixIcon: Icon(Iconsax.user_add)),
                    ),
                    //Email
                    const SizedBox(height: KSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: KTexts.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),
                    //Phone number
                    const SizedBox(height: KSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: KTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    //Password
                    const SizedBox(height: KSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: KTexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    //Terms and conditions checkbox
                    const SizedBox(height: KSizes.spaceBtwInputFields),
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(value: true, onChanged: (value) {}),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '${KTexts.iAgreeTo} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                text: '${KTexts.privacyPolicy} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(
                                      color: dark
                                          ? KColors.light
                                          : KColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? KColors.light
                                          : KColors.primary,
                                    ),
                              ),
                              TextSpan(
                                text: '${KTexts.and} ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: '${KTexts.termsOfUse}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(
                                      color: dark
                                          ? KColors.light
                                          : KColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? KColors.light
                                          : KColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //create account
                    const SizedBox(height: KSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(VerifyEmailScreen()),
                        child: Text(KTexts.createAccount),
                      ),
                    ),
                    //Divider
                    const SizedBox(height: KSizes.spaceBtwSections),
                    KFormDivider(dividerText: KTexts.orSignUpWith),
                    //Social Buttons
                    const SizedBox(height: KSizes.spaceBtwSections),
                    KSocialButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
