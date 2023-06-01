import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/models/update_dsandws_model.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../../../../models/city_model.dart';
import '../../../../../../models/province_model.dart';
import '../../../../../../services/service.dart';
import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/custom_textformfield.dart';

class UpdateDisabilityPage extends StatefulWidget {
  final String id;
  final String name;
  final String age;
  final String phone;
  final String address;
  const UpdateDisabilityPage(
      {super.key,
      required this.id,
      required this.name,
      required this.age,
      required this.phone,
      required this.address, 
      });

  @override
  State<UpdateDisabilityPage> createState() => _UpdateDisabilityPageState();
}

class _UpdateDisabilityPageState extends State<UpdateDisabilityPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rightDisabilityController = TextEditingController();
  TextEditingController leftDisabilityController = TextEditingController();
  TextEditingController prostheticDisabilityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  ProvinceModel? provinceModel;
  CityModel? cityModel;
  List disability = ['Tangan', 'Kaki'];
  String disabilityDdItem = 'Tangan';
  List rightDisability = [
    'Normal',
    'Pangkal Bahu',
    'Atas Siku',
    'Bawah Siku',
    'Pergelangan',
    'Jari Telunjuk',
    'Jari Tengah',
    'Jari Manis'
  ];
  String rightDisabilityDdItem = 'Normal';
  List leftDisability = [
    'Normal',
    'Pangkal Bahu',
    'Atas Siku',
    'Bawah Siku',
    'Pergelangan',
    'Jari Telunjuk',
    'Jari Tengah',
    'Jari Manis'
  ];
  String leftDisabilityDdItem = 'Normal';
  List prostheticDisability = [
    'Prostetik Pangkal Bahu',
    'Prostetik Atas Siku',
    'Prostetik Bawah Siku',
    'Prostetik jari bersisa 2 ruas',
    'Prostetik jari bersisa 1 ruas'
  ];
  String prostheticDisabilityDdItem = 'Prostetik Pangkal Bahu';
  List provinceName = [];
  List provinceId = [];
  String provinceDdItem = '';
  int idProvince = 0;
  List cityName = [];
  List cityId = [];
  String cityDdItem = '';
  int idCity = 0;
  bool isLoading = false;
  final snackBar = const SnackBar(
    content: Text('Kota/Kabupaten tidak boleh kosong'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

  Future getProvince() async {
    provinceModel = await province();
    var dataProvince = provinceModel!.data;
    for (var i = 0; i < dataProvince.length; i++) {
      provinceName.add(dataProvince[i].provinceName);
      provinceId.add(dataProvince[i].id);
    }
    if (provinceName.isNotEmpty) {
      setState(() {
        provinceDdItem = provinceName.first;
      });
    }
  }

  Future getCity(String idProvince) async {
    cityName.clear();
    cityId.clear();
    cityModel = await city(idProvince);
    var dataCity = cityModel!.data;
    for (var i = 0; i < dataCity.length; i++) {
      cityName.add(dataCity[i].name);
      cityId.add(dataCity[i].id);
    }
    if (cityName.isNotEmpty) {
      setState(() {
        cityDdItem = cityName.first;
      });
    }
  }

  void updatedData() async {
    if (idProvince == 0) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        isLoading = true;
      });

      UpadateDsAndWsModel upadateDsAndWsModel = await updateDisability(
          widget.id,
          idCity.toString(),
          idProvince.toString(),
          nameController.text,
          addressController.text,
          phoneController.text,
          ageController.text,
          disabilityDdItem,
              disabilityDdItem == 'Tangan'
                  ? leftDisabilityDdItem
                  : leftDisabilityController.text,
              disabilityDdItem == 'Tangan'
                  ? rightDisabilityDdItem
                  : rightDisabilityController.text,
              prostheticDisabilityDdItem);

      if (upadateDsAndWsModel.message == 'Update Success!') {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Update berhasil!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ));
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamedAndRemoveUntil(
            context, '/disabilityadmin', ModalRoute.withName('/main'));
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Update gagal!'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    getProvince();
    nameController.text = widget.name;
    addressController.text = widget.address;
    phoneController.text = widget.phone;
    ageController.text = widget.age;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Update'),
          const SizedBox(width: 10),
          Image.asset(
            'assets/images/disability.png',
            scale: 25,
          )
        ],
      )),
      body: ListView(
        children: [
          CustomContainer(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 15, left: 12, right: 12),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: nameController,
                  title: 'Nama',
                  onTap: () => null,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        controller: ageController,
                        title: 'Umur',
                        onTap: () => null,
                        isNumberField: true,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      flex: 4,
                      child: CustomTextFormField(
                        controller: phoneController,
                        title: 'Nomor Telepon',
                        onTap: () => null,
                        isNumberField: true,
                      ),
                    ),
                  ],
                ),
                CustomDropDown(
                  title: 'Disabilitas',
                  value: disabilityDdItem,
                  onChanged: (value) {
                    setState(() {
                      disabilityDdItem = value.toString();
                    });
                  },
                  items: disability.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                disabilityDdItem == 'Tangan'
                        ? Row(
                            children: [
                              Flexible(
                                child: CustomDropDown(
                                  title: 'Amputasi Kanan',
                                  value: rightDisabilityDdItem,
                                  onChanged: (value) {
                                    setState(() {
                                      rightDisabilityDdItem = value;
                                    });
                                  },
                                  items: rightDisability
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: CustomDropDown(
                                  title: 'Amputasi Kiri',
                                  value: leftDisabilityDdItem,
                                  onChanged: (value) {
                                    setState(() {
                                      leftDisabilityDdItem = value;
                                    });
                                  },
                                  items: leftDisability
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  controller: rightDisabilityController,
                                  title: 'Amputasi Kanan',
                                  onTap: () => null,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: leftDisabilityController,
                                  title: 'Amputasi Kiri',
                                  onTap: () => null,
                                ),
                              ),
                            ],
                          ),
                if (disabilityDdItem == 'Tangan') const SizedBox(height: 10),
                disabilityDdItem == 'Tangan'
                    ? CustomDropDown(
                        title: 'Jenis Prostetik Yang Dibutuhkan',
                        value: prostheticDisabilityDdItem,
                        onChanged: (value) {
                          setState(() {
                            prostheticDisabilityDdItem = value.toString();
                          });
                        },
                        items: prostheticDisability
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    : CustomTextFormField(
                        controller: prostheticDisabilityController,
                        title: 'Jenis Prostetik Yang Dibutuhkan',
                        onTap: () => null,
                      ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: addressController,
                  title: 'Alamat',
                  onTap: () => null,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomDropDown(
                        title: 'Provinsi',
                        value: provinceDdItem,
                        onChanged: (value) {
                          setState(() {
                            provinceDdItem = value;
                            var provinceIndexOf = provinceName.indexOf(value);
                            idProvince = provinceId[provinceIndexOf];
                            if (idProvince == 1) {
                              setState(() {
                                getCity(idProvince.toString());
                              });
                            } else {
                              setState(() {
                                getCity(idProvince.toString());
                              });
                            }
                          });
                        },
                        items:
                            provinceName.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomDropDown(
                        title: 'Kota/Kabupaten',
                        value: cityDdItem,
                        onChanged: (value) {
                          setState(() {
                            cityDdItem = value;
                            var cityIndexOf = cityName.indexOf(value);
                            idCity = cityId[cityIndexOf];
                          });
                        },
                        items: cityName.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  isLoading: isLoading,
                  onTap: updatedData,
                  title: 'Update',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
