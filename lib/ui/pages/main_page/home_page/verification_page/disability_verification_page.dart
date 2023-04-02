import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/models/disability_verification_model.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../../../models/city_model.dart';
import '../../../../../models/province_model.dart';
import '../../../../../services/service.dart';
import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../shared/widgets/custom_textformfield.dart';

class DisabilityVerPage extends StatefulWidget {
  const DisabilityVerPage ({super.key});

  @override
  State<DisabilityVerPage> createState() => _DisabilityVerPageState();
}

class _DisabilityVerPageState extends State<DisabilityVerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController explanationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  ProvinceModel? provinceModel;
  CityModel? cityModel;
  List disability = ['tangan', 'kaki'];
  String disabilityDdItem = 'tangan';
  List provinceName = [];
  List provinceId = [];
  String provinceDdItem = '';
  int idProvince = 0;
  List cityName = [];
  List cityId = [];
  String cityDdItem = '';
  int idCity = 0;

  Future getProvince()async{
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

  Future getCity(String idProvince)async{
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

  @override
  void initState() {
    getProvince();
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
            const Text('Verification'),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/disability.png',
              scale: 25,
            )
          ],
        )
      ),
      body: ListView(
        children: [
          CustomContainer(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 15, left: 12, right: 12),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: nameController, title: 'Name', onTap: () => null,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        controller: nameController, title: 'Age', onTap: () => null, isNumberField: true,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      flex: 4,
                      child: CustomTextFormField(
                        controller: nameController, title: 'Phone Number', onTap: () => null, isNumberField: true,
                      ),
                    ),
                  ],
                ),
                CustomDropDown(
                  title: 'Disability', 
                  value: disabilityDdItem,
                  onChanged: (value) {
                    setState(() {
                      disabilityDdItem = value.toString();
                    });
                  },
                  items: disability.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value == 'tangan' ? 'Tangan' : 'Kaki'),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: nameController, title: 'Explanation', onTap: () => null,
                ),
                CustomTextFormField(
                  controller: nameController, title: 'Address', onTap: () => null,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomDropDown(
                        title: 'Province', 
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
                            }else{
                              setState(() {
                                getCity(idProvince.toString());
                              });
                            }
                          });
                        },
                        items: provinceName.map<DropdownMenuItem<String>>((value) {
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
                        title: 'City', 
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
                            child: Text(value, overflow: TextOverflow.ellipsis,),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: ()async{
                    DisabilityVerificationModel disabilityVerificationModel = await disabilityver(
                      nameController.text, 
                      idCity.toString(), 
                      idProvince.toString(), 
                      ageController.text, 
                      addressController.text, 
                      phoneController.text, 
                      disabilityDdItem, 
                      explanationController.text
                    );
                    print(disabilityVerificationModel.message);
                  },
                  title: 'Verification',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}