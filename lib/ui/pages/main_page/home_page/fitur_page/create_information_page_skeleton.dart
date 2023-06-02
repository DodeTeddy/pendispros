import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_container.dart';
import '../../../../shared/widgets/custom_shimmer.dart';

class CreateInformationPageSkeleton extends StatelessWidget {
  const CreateInformationPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const CustomContainer(
          margin: EdgeInsets.only(left: 12, right: 12, top: 10),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              CustomCircleShimmer(height: 50, width: 50),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmer(height: 15, width: 50),
                    SizedBox(height: 5),
                    CustomShimmer(height: 15, width: double.infinity)
                  ],
                ),
              ),
              Row(
                children: [
                  CustomCircleShimmer(height: 20, width: 20),
                  SizedBox(width: 20),
                  CustomCircleShimmer(height: 20, width: 20)
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}