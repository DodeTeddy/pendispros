import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_shimmer.dart';

class ProfilePageSkeleton extends StatelessWidget {
  const ProfilePageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmer(height: 25, width: 50),
              SizedBox(height: 15),
              CustomContainer(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomCircleShimmer(height: 55, width: 55),
                              SizedBox(width: 10),
                              CustomShimmer(height: 15, width: 60)
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
                              CustomShimmer(height: 15, width: 150),
                            ],
                          )
                        ],
                      )
                    ),
                    CustomShimmer(height: 25, width: 25)
                  ],
                )
              ),
              SizedBox(height: 20),
              CustomContainer(
                color: primaryColor,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomShimmer(height: 15, width: 150),
                        CustomCircleShimmer(height: 35, width: 35)
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomShimmer(height: 15, width: 60),
                        CustomCircleShimmer(height: 20, width: 20)
                      ],
                    )
                  ],
                )
              ),
              SizedBox(height: 20),
              CustomShimmer(height: 25, width: 150),
              SizedBox(height: 5),
              CustomContainer(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomShimmer(height: 25, width: 25),
                            SizedBox(width: 10),
                            CustomShimmer(height: 25, width: 50),
                          ],
                        ),
                        CustomShimmer(height: 30, width: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: primaryColor,
                      thickness: 1,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomShimmer(height: 25, width: 25),
                            SizedBox(width: 10),
                            CustomShimmer(height: 25, width: 50),
                          ],
                        ),
                        CustomShimmer(height: 30, width: 25),
                      ],
                    )
                  ],
                )
              ),
              SizedBox(height: 20),
              CustomShimmer(height: 25, width: 100),
              SizedBox(height: 5),
              CustomContainer(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomShimmer(height: 25, width: 25),
                        SizedBox(width: 10),
                        CustomShimmer(height: 25, width: 50),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}