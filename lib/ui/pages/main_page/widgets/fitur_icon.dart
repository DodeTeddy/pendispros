import 'package:flutter/material.dart';

class FiturIcon extends StatelessWidget {
  final Function() onTap;
  final String asset;
  final String title;
  const FiturIcon({super.key, required this.onTap,required this.asset, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 90,
        width: 80,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(asset)
                )
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}