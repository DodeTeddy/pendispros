import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';

class DetailDataPage extends StatelessWidget {
  final bool isDisability;
  const DetailDataPage({super.key, required this.isDisability});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Detail Data Terkini'),
      ),
      body: isDisability
          ? FutureBuilder(
              future: getLatestData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var dataLatest = snapshot.data;
                  List tanganTotalData = [];
                  List kakiTotalData = [];
                  List baliTotalData = [];
                  List jatimTotalData = [];
                  for (var i = 0; i < dataLatest!.disability.length; i++) {
                    if (dataLatest.disability[i].disability == 'Tangan') {
                      tanganTotalData.add(dataLatest.disability[i].disability);
                    }
                    if (dataLatest.disability[i].disability == 'Kaki') {
                      kakiTotalData.add(dataLatest.disability[i].disability);
                    }
                    if (dataLatest.disability[i].province.id == 1) {
                      baliTotalData.add(dataLatest.disability[i].province.id);
                    }
                    if (dataLatest.disability[i].province.id == 2) {
                      jatimTotalData.add(dataLatest.disability[i].province.id);
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: DChartBarCustom(
                            showDomainLine: true,
                            showMeasureLine: true,
                            showDomainLabel: true,
                            showMeasureLabel: true,
                            spaceBetweenItem: 8,
                            listData: [
                              DChartBarDataCustom(
                                  value: double.parse(
                                      tanganTotalData.length.toString()),
                                  label: 'Tangan',
                                  showValue: true),
                              DChartBarDataCustom(
                                  value: double.parse(
                                      kakiTotalData.length.toString()),
                                  label: 'Kaki',
                                  showValue: true),
                              DChartBarDataCustom(
                                  value: double.parse(
                                      baliTotalData.length.toString()),
                                  label: 'Bali',
                                  showValue: true),
                              DChartBarDataCustom(
                                  value: double.parse(
                                      jatimTotalData.length.toString()),
                                  label: 'Jawa Timur',
                                  showValue: true),
                              DChartBarDataCustom(
                                  value: double.parse(
                                      dataLatest.disability.length.toString()),
                                  label: 'Total',
                                  showValue: true),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          title: 'Export',
                          onTap: () {},
                        )
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              },
            )
          : FutureBuilder(
              future: getLatestData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var dataLatest = snapshot.data;
                  List baliTotalData = [];
                  List jatimTotalData = [];
                  for (var i = 0; i < dataLatest!.prosthetic.length; i++) {
                    if (dataLatest.prosthetic[i].province.id == 1) {
                      baliTotalData.add(dataLatest.prosthetic[i].province.id);
                    }
                    if (dataLatest.prosthetic[i].province.id == 2) {
                      jatimTotalData.add(dataLatest.prosthetic[i].province.id);
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: DChartBarCustom(
                            showDomainLine: true,
                            showMeasureLine: true,
                            showDomainLabel: true,
                            showMeasureLabel: true,
                            spaceBetweenItem: 8,
                            listData: [
                              DChartBarDataCustom(
                                  value: double.parse(
                                      baliTotalData.length.toString()),
                                  label: 'Bali',
                                  showValue: true),
                              DChartBarDataCustom(
                                  value: double.parse(
                                      jatimTotalData.length.toString()),
                                  label: 'Jawa Timur',
                                  showValue: true),
                              DChartBarDataCustom(
                                  value: double.parse(
                                      dataLatest.prosthetic.length.toString()),
                                  label: 'Total',
                                  showValue: true),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          title: 'Export',
                          onTap: () {},
                        )
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              },
            ),
    );
  }
}
