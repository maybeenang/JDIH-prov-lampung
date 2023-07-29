import 'package:flutter/material.dart';
import 'package:jdih/components/appbar_page.dart';

class PutusanPage extends StatelessWidget {
  const PutusanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage("Putusan", context),
      body: const Center(
        child: Text('Putusan'),
      ),
    );
  }
}
