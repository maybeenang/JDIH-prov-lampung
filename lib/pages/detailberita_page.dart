import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/constants/api.dart';
import 'package:jdih/constants/string.dart';
import 'package:jdih/models/berita.dart';
import 'package:jdih/providers/berita_controller.dart';
import 'package:jdih/styles/colors.dart';

class DetailBeritaPage extends ConsumerStatefulWidget {
  const DetailBeritaPage({Key? key, required this.params}) : super(key: key);

  final String params;

  @override
  DetailBeritaPageState createState() => DetailBeritaPageState();
}

class DetailBeritaPageState extends ConsumerState<DetailBeritaPage> {
  Future<Berita> berita() async {
    try {
      final Dio dio = Dio();
      final Uri uri = Uri.parse(
          "${EndPoint.beritaBaseUrl}${EndPoint.berita}/${widget.params}");
      final response = await dio.get(
        uri.toString(),
      );
      final Berita berita = Berita.fromJson(response.data);
      ref.refresh(beritaControllerProvider.notifier).fetchBerita();
      return berita;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPage("Berita", context),
      body: FutureBuilder<Berita>(
        future: berita(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image(
                    image: NetworkImage(snapshot.data!.image!),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.title!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        AppString.convertDate(snapshot.data!.date!),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        snapshot.data!.content!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ));
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
