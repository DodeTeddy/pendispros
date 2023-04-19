import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tugas_akhir_app/ui/shared/widgets/custom_appbar.dart';

class InformationServicePage extends StatelessWidget {
  const InformationServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: Text('Layanan Informasi')
      ),
    );
  }
}