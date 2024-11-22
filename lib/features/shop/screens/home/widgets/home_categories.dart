import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:infinity_edge_app/features/shop/screens/sub_category/sub_category.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';

class KHomeCategories extends StatelessWidget {
  const KHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return KVerticalImageText(
            image: KImages.shoeIcon,
            title: "Shoes",
            onTap: () => Get.to(() => SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
