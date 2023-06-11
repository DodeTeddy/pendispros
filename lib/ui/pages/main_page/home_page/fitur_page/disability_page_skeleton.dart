import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_shimmer.dart';

import '../../../../shared/widgets/custom_container.dart';

class DisabilityPageSkeleton extends StatelessWidget {
  const DisabilityPageSkeleton ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const CustomContainer(
        margin: EdgeInsets.symmetric( vertical: 5, horizontal: 12),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            CustomCircleShimmer(height: 40, width: 40),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomShimmer(height: 15, width: 100),
                  SizedBox(height: 10),
                  CustomShimmer(height: 15, width: 150),
                  SizedBox(height: 5),
                  CustomShimmer(height: 15, width: 150),
                  SizedBox(height: 5),
                  CustomShimmer(height: 15, width: 150),
                  SizedBox(height: 5),
                  CustomShimmer(height: 15, width: 150),
                  SizedBox(height: 5),
                  CustomShimmer(height: 15, width: 250),
                  SizedBox(height: 10),
                  
                  Row(
                    children: [
                      CustomShimmer(height: 20, width: 20),
                      SizedBox(width: 10),
                      CustomShimmer(height: 15, width: 100),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomShimmer(height: 20, width: 20),
                      SizedBox(width: 10),
                      CustomShimmer(height: 15, width: 100),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomShimmer(height: 20, width: 20),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomShimmer(height: 15, width: 200),
                          SizedBox(height: 5),
                          CustomShimmer(height: 15, width: 100),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}