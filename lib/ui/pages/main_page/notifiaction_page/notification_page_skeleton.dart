import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_shimmer.dart';

import '../../../shared/widgets/custom_container.dart';

class NotificationPageSkeleton extends StatelessWidget {
  const NotificationPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const CustomContainer(
          margin: EdgeInsets.symmetric(
              vertical: 5, horizontal: 12),
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmer(height: 50, width: 50),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmer(height: 15, width: 80),
                    SizedBox(height: 10),
                    CustomShimmer(height: 15, width: double.infinity),
                    SizedBox(height: 5),
                    CustomShimmer(height: 15, width: double.infinity),
                    SizedBox(height: 10),
                    CustomShimmer(height: 100, width: double.infinity),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomShimmer(height: 15, width: 100),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}