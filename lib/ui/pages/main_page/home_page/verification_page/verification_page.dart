import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/models/verification_model.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_button.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_container.dart';

import '../../../../../models/city_model.dart';
import '../../../../../models/province_model.dart';
import '../../../../../services/service.dart';
import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../shared/widgets/custom_textformfield.dart';

class VerificationPage extends StatefulWidget {
  final bool isDisability;
  const VerificationPage ({super.key, required this.isDisability});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController explanationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  ProvinceModel? provinceModel;
  CityModel? cityModel;
  List disability = ['Tangan', 'Kaki'];
  String disabilityDdItem = 'Tangan';
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
    content: Text('Kolom tidak boleh kosong'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );
  final snackBarSuccess = const SnackBar(
    content: Text('Verifikasi berhasil!'),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
  );
  final snackBarFailed = const SnackBar(
    content: Text('Verifikasi gagal!'),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

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

  void vererification()async{
    if ( widget.isDisability 
      ? (nameController.text.isEmpty || ageController.text.isEmpty || phoneController.text.isEmpty || explanationController.text.isEmpty ||addressController.text.isEmpty)
      : (nameController.text.isEmpty || phoneController.text.isEmpty || addressController.text.isEmpty)
    ) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      setState(() {
        isLoading = true;
      });
      VerificationModel verificationModel = widget.isDisability ? await disabilityver(
        nameController.text, 
        idCity.toString(), 
        idProvince.toString(), 
        ageController.text, 
        addressController.text, 
        phoneController.text, 
        disabilityDdItem, 
        explanationController.text
      )
      : await workshopver(
        nameController.text, 
        idCity.toString(), 
        idProvince.toString(), 
        addressController.text, 
        phoneController.text, 
      );
      if (verificationModel.message == 'Verification Success!') {  
        if(!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }else{
        if(!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(snackBarFailed);
        setState(() {
          isLoading = false;
        });
      }
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
            const Text('Verifikasi'),
            const SizedBox(width: 10),
            Image.asset(
              widget.isDisability ? 'assets/images/disability.png' : 'assets/images/prosthetic.png',
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
                  controller: nameController, title: widget.isDisability ? 'Nama' : 'Name Bengkel Prostetik', onTap: () => null,
                ),
                widget.isDisability ?
                Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        controller: ageController, title: 'Umur', onTap: () => null, isNumberField: true,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      flex: 4,
                      child: CustomTextFormField(
                        controller: phoneController, title: 'Nomor Telepon', onTap: () => null, isNumberField: true,
                      ),
                    ),
                  ],
                )
                : CustomTextFormField(controller: phoneController, title: 'Nomor Telepon', onTap: () => null, isNumberField: true),
                Visibility(
                  visible: widget.isDisability,
                  child: CustomDropDown(
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
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: widget.isDisability,
                  child: CustomTextFormField(
                    controller: explanationController, title: 'Detail disabilitas', onTap: () => null,
                  ),
                ),
                CustomTextFormField(
                  controller: addressController, title: 'Alamat', onTap: () => null,
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
                            child: Text(value, overflow: TextOverflow.ellipsis,),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  isLoading: isLoading,
                  onTap: vererification,
                  title: 'Verifikasi',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}