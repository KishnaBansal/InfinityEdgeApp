import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/bindings/general_bindings.dart';
import 'package:infinity_edge_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: KAppTheme.lightTheme,
      darkTheme: KAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      //Show loader to meanwhile authentication repository is deciding which screen to display
      home: Scaffold(
        backgroundColor: KColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
