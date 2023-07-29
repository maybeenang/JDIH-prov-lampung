import 'package:flutter/material.dart';
import 'package:jdih/components/appbar_page.dart';

class GaleriPage extends StatelessWidget {
  const GaleriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage("Galeri", context),
      body: const Center(
        child: Text('Galeri'),
      ),
    );
  }
}
