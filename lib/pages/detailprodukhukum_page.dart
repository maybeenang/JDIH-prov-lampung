import 'package:flutter/material.dart';
import 'package:jdih/components/table_detailprodukhukum.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    start: BorderSide(
                      color: AppColors.textColor,
                      width: 6.0,
                    ),
                  ),
                ),
                padding:
                    const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
                child: const Text(
                  'PERATURAN PEMERINTAH REPUBLIK INDONESIA Nomor 35 Tahun 2023 Tentang KETENTUAN UMUM PAJAK DAERAH DAN RETRIBUSI DAERAH',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.15),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            left: 17.5, right: 25, top: 12.5, bottom: 12.5)),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.textColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.file_download, color: Colors.white),
                  label: const Text('Unduh Dokumen',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              const SizedBox(height: 20),
              const Text(
                'Deskripsi Produk Hukum',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Nomor 35 Tahun 2023 Tentang KETENTUAN UMUM PAJAK DAERAH DAN RETRIBUSI DAERAH ini ditetapkan dan diundangkan pada 2023-06-16 di JAKARTA',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Metadata Produk Hukum',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TableDetailProdukHukum()
            ],
          ),
        ),
      ),
    );
  }
}
