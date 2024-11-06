import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class KCurvedEdgeWidget extends StatelessWidget {
  const KCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: KCustomClipper(),
      child: child,
    );
  }
}
