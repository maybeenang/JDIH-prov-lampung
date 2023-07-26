import 'package:flutter/material.dart';
import 'package:jdih/styles/colors.dart';

class DetailProdukHukumPage extends StatelessWidget {
  const DetailProdukHukumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: IconButton.filled(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.textColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            )),
        toolbarHeight: 90,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text('Produk Hukum',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      body: const Center(
        child: Text('Detail Produk Hukum'),
      ),
    );
  }
}
