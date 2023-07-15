import 'package:flutter/material.dart';
import '../../../../shared/theme/constant.dart';
import '../../../../shared/widgets/custom_container.dart';

class DataLatestWidget extends StatelessWidget {
  final String disabilitasData;
  final String prostetikData;
  final Function() disabilitasOnTap;
  final Function() prostetikOnTap;
  const DataLatestWidget(
      {super.key,
      required this.disabilitasData,
      required this.prostetikData,
      required this.disabilitasOnTap,
      required this.prostetikOnTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CustomContainer(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Data saat ini',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: disabilitasOnTap,
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Disabilitas',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          disabilitasData,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: prostetikOnTap,
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Bengkel Prostetik',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          prostetikData,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
