import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';

class KPrimaryHeaderContainer extends StatelessWidget {
  const KPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KCurvedEdgeWidget(
      child: Container(
        color: KColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: KCircularContainer(
                  backgroundColor: KColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: KCircularContainer(
                  backgroundColor: KColors.textWhite.withOpacity(0.1),
                ),
              ),
              // Adding the child directly inside the Stack
              Center(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// class KPrimaryHeaderContainer extends StatelessWidget {
//   const KPrimaryHeaderContainer({
//     super.key, required this.child,
//   });

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return KCurvedEdgeWidget(
//       child: Container(
//         color: KColors.primary,
//         padding: const EdgeInsets.all(0),
//         child: SizedBox(
//           height: 400,
//           child: Stack(
//             children: [
//               Positioned(
//                 top: -150,
//                 right: -250,
//                 child: KCircularContainer(
//                   backgroundColor: KColors.textWhite.withOpacity(0.1),
//                 ),
//               ),
//               Positioned(
//                 top: 100,
//                 right: -300,
//                 child: KCircularContainer(
//                   backgroundColor: KColors.textWhite.withOpacity(0.1),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }