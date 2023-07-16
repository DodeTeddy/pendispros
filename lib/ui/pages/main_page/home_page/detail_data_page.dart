import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/services/service.dart';
import 'package:tugas_akhir_app/ui/shared/theme/constant.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DetailDataPage extends StatefulWidget {
  final bool isDisability;
  const DetailDataPage({super.key, required this.isDisability});

  @override
  State<DetailDataPage> createState() => _DetailDataPageState();
}

class _DetailDataPageState extends State<DetailDataPage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> associateListDisability = [];
    List<dynamic> associateListProsthetic = [];
    const snackBar = SnackBar(
      content: Text('Export Berhasil!'),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    );

    void generateCsvFileDisability() async {
      List<List<dynamic>> rows = [];

      List<dynamic> row = [];
      row.add("No");
      row.add("Nama");
      row.add("Umur");
      row.add("Telepon");
      row.add("Disabilitas");
      row.add("Disabilitas Kiri");
      row.add("Disabilitas Kanan");
      row.add("Alamat");
      row.add("Kota/Kabupaten");
      row.add("Provinsi");
      rows.add(row);
      for (int i = 0; i < associateListDisability.length; i++) {
        List<dynamic> row = [];
        row.add(associateListDisability[i]["no"]);
        row.add(associateListDisability[i]["nama"]);
        row.add(associateListDisability[i]["umur"]);
        row.add(associateListDisability[i]["telepon"]);
        row.add(associateListDisability[i]["disabilitas"]);
        row.add(associateListDisability[i]["disabilitas_kiri"]);
        row.add(associateListDisability[i]["disabilitas_kanan"]);
        row.add(associateListDisability[i]["alamat"]);
        row.add(associateListDisability[i]["kota"]);
        row.add(associateListDisability[i]["provinsi"]);
        rows.add(row);
      }

      String csv = const ListToCsvConverter().convert(rows);

      if (Platform.isAndroid) {
        String dir = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS);
        String file = dir;

        File f = File('$file/data_disabilitas.csv');

        f.writeAsString(csv).whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(snackBar));
      } else {
        Directory dir = await getApplicationDocumentsDirectory();

        String file = dir.path;

        File f = File('$file/data_disabilitas.csv');

        f.writeAsString(csv).whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(snackBar));
      }
    }

    void generateCsvFileWorkshop() async {
      List<List<dynamic>> rows = [];

      List<dynamic> row = [];
      row.add("No");
      row.add("Nama Bengkel Prostetik");
      row.add("Telepon");
      row.add("Alamat");
      row.add("Kota/Kabupaten");
      row.add("Provinsi");
      rows.add(row);
      for (int i = 0; i < associateListProsthetic.length; i++) {
        List<dynamic> row = [];
        row.add(associateListProsthetic[i]["no"]);
        row.add(associateListProsthetic[i]["nama"]);
        row.add(associateListProsthetic[i]["telepon"]);
        row.add(associateListProsthetic[i]["alamat"]);
        row.add(associateListProsthetic[i]["kota"]);
        row.add(associateListProsthetic[i]["provinsi"]);
        rows.add(row);
      }

      String csv = const ListToCsvConverter().convert(rows);

      if (Platform.isAndroid) {
        String dir = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS);
        String file = dir;

        File f = File('$file/data_bengkel_prostetik.csv');

        f.writeAsString(csv).whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(snackBar));
      } else {
        Directory dir = await getApplicationDocumentsDirectory();

        String file = dir.path;

        File f = File('$file/data_bengkel_prostetik.csv');

        f.writeAsString(csv).whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(snackBar));
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(
        child: Text('Detail Data Terkini'),
      ),
      body: widget.isDisability
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
                    associateListDisability.add({
                      "no": dataLatest.disability[i].id,
                      "nama": dataLatest.disability[i].name,
                      "umur": dataLatest.disability[i].age,
                      "telepon": dataLatest.disability[i].phoneNumber,
                      "disabilitas": dataLatest.disability[i].disability,
                      "disabilitas_kiri":
                          dataLatest.disability[i].jenisAmputasiKiri,
                      "disabilitas_kanan":
                          dataLatest.disability[i].jenisAmputasiKanan,
                      "alamat": dataLatest.disability[i].address,
                      "kota": dataLatest.disability[i].city.name,
                      "provinsi":
                          dataLatest.disability[i].province.provinceName,
                    });
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
                          onTap: generateCsvFileDisability,
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
                    associateListProsthetic.add({
                      "no": dataLatest.prosthetic[i].id,
                      "nama": dataLatest.prosthetic[i].workshopName,
                      "telepon": dataLatest.prosthetic[i].phoneNumber,
                      "alamat": dataLatest.prosthetic[i].address,
                      "kota": dataLatest.prosthetic[i].city.name,
                      "provinsi":
                          dataLatest.prosthetic[i].province.provinceName,
                    });
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
                          onTap: generateCsvFileWorkshop,
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
