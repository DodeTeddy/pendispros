import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';
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
  ProvinceModel? provinceModel;
  CityModel? cityModel;
  List provinceName = [];
  String provinceDdItem = '';
  int provinceId = 1;
  List disability = ['tangan', 'kaki'];
  String disabilityDdItem = 'tangan';

  Future getProvince()async{
    provinceModel = await province();
    var dataProvince = provinceModel!.data;
    for (var i = 0; i < dataProvince.length; i++) {
      provinceName.add(dataProvince[i].provinceName);
    }
    if (provinceName.isNotEmpty) {
      setState(() {
        provinceDdItem = provinceName.first;
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
    TextEditingController controller = TextEditingController();
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
                  controller: controller, title: 'Name', onTap: () => null,
                ),
                CustomTextFormField(
                  controller: controller, title: 'Age', onTap: () => null,
                ),
                CustomTextFormField(
                  controller: controller, title: 'Phone Number', onTap: () => null,
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
                  controller: controller, title: 'Explanation', onTap: () => null,
                ),
                CustomTextFormField(
                  controller: controller, title: 'Address', onTap: () => null,
                ),
                CustomDropDown(
                  title: 'Province', 
                  value: provinceDdItem,
                  onChanged: (value) {
                    setState(() {
                      provinceId = provinceName.indexOf(value) + 1;
                    });
                  },
                  items: provinceName.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                CustomDropDown(
                  title: 'City', 
                  value: provinceDdItem,
                  onChanged: (value) {
                    setState(() {
                      provinceId = provinceName.indexOf(value) + 1;
                    });
                  },
                  items: provinceName.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}