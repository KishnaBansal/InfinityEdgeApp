import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/features/authentication/controllers/login/login_controller.dart';
import 'package:infinity_edge_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/signup.dart';
import 'package:infinity_edge_app/navigation_menu.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';
import 'package:infinity_edge_app/utils/validators/validation.dart';

class KLoginForm extends StatelessWidget {
  const KLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: KSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => KValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: KTexts.email,
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwInputFields),
            //Password
            Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => KValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: KTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
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
                    Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
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
                onPressed: () => controller.emailAndPasswordSignIn(),
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
    );
  }
}