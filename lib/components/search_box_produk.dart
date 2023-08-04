import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jdih/bloc/produkhukum_bloc/produkhukum_bloc.dart';

import '../styles/colors.dart';

class SearchBoxProduk extends StatefulWidget {
  const SearchBoxProduk({super.key});

  @override
  State<SearchBoxProduk> createState() => _SearchBoxProdukState();
}

class _SearchBoxProdukState extends State<SearchBoxProduk> {
  final judul = TextEditingController();
  final tahun = TextEditingController();
  final nomor = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdukhukumBloc, ProdukhukumState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: AppColors.textColor),
          child: Column(
            children: [
              TextField(
                controller: judul,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Judul Dokumen',
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 14,
                  ),
                ),
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: tahun,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tahun',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      controller: nomor,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nomor',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // context.go('/filterprodukhukum');
                      context.read<ProdukhukumBloc>().add(
                            ProdukHukumFilter(
                              tahun: tahun.text,
                              nomor: nomor.text,
                              judul: judul.text,
                            ),
                          );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xFFF4C54D)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        )),
                    child: const Text('Cari',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }
}
