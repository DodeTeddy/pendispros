import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  const CustomShimmer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200, 
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}

class CustomCircleShimmer extends StatelessWidget {
  final double height;
  final double width;
  const CustomCircleShimmer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200, 
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}