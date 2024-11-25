import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/form_divider.dart';
import 'package:infinity_edge_app/common/widgets/login_signup/social_buttons.dart';
import 'package:infinity_edge_app/data/repositries/authentication/authentication_repository.dart';
import 'package:infinity_edge_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/verify_email.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/widgets/TnCcheckbox.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';
import 'package:infinity_edge_app/utils/validators/validation.dart';

class KSignUpForm extends StatelessWidget {
  const KSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      KValidator.validateEmptyText("First Name", value),
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
                  controller: controller.lastName,
                  validator: (value) =>
                      KValidator.validateEmptyText("Last Name", value),
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
            controller: controller.username,
            validator: (value) =>
                KValidator.validateEmptyText("Username", value),
            decoration: InputDecoration(
                labelText: KTexts.username, prefixIcon: Icon(Iconsax.user_add)),
          ),

          //Email
          const SizedBox(height: KSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => KValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: KTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          //Phone number
          const SizedBox(height: KSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => KValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: KTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          //Password
          const SizedBox(height: KSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => KValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: KTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),

          //Terms and conditions checkbox
          const SizedBox(height: KSizes.spaceBtwInputFields),
          KTermsAndConditionsCheckbox(),
          //create account
          const SizedBox(height: KSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              child: Text(KTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}


