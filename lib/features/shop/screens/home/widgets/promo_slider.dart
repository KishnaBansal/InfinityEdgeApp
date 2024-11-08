import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:infinity_edge_app/common/widgets/images/rounded_image.dart';
import 'package:infinity_edge_app/features/shop/controllers/home_controller.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class KPromoSlider extends StatelessWidget {
  const KPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => KRoundedImage(imageUrl: url),).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: KSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  KCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? KColors.primary
                        : KColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
