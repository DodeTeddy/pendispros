import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_shimmer.dart';

import '../../../shared/theme/constant.dart';
import '../../../shared/widgets/custom_container.dart';
import '../../onboarding_page/widgets/dot.dart';

class HomePageSkeleton extends StatefulWidget {
  const HomePageSkeleton({super.key});

  @override
  State<HomePageSkeleton> createState() => _HomePageSkeletonState();
}

class _HomePageSkeletonState extends State<HomePageSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomShimmer(height: 25, width: 150),
                  const SizedBox(height: 20),
                  CustomContainer(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmer(height: 20, width: 100),
                            SizedBox(height: 20),
                            CustomShimmer(height: 20, width: 150),
                          ],
                        ),
                        Image.asset(
                          'assets/images/heading.png',
                          scale: 13,
                        )
                      ],
                    )
                  ),
                  const SizedBox(height: 30),
                  const CustomShimmer(height: 25, width: 50),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomShimmer(height: 90, width: 80),
                      CustomShimmer(height: 90, width: 80),
                      CustomShimmer(height: 90, width: 80),
                      CustomShimmer(height: 90, width: 80),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomShimmer(height: 90, width: 80),
                      SizedBox(height: 90, width: 80),
                      SizedBox(height: 90, width: 80),
                      SizedBox(height: 90, width: 80),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const CustomShimmer(height: 130, width: double.infinity),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Dot(
                        index: index, 
                        currentPage: 0
                      )
                    ),
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}