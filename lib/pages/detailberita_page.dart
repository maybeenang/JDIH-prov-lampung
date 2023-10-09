import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdih/components/appbar_page.dart';
import 'package:jdih/constants/api.dart';
import 'package:jdih/models/berita.dart';
import 'package:jdih/providers/berita_controller.dart';
import 'package:jdih/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

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
      final Uri uri = Uri.parse("${EndPoint.endpointBaseUrl}${EndPoint.beritaEndpoint}/${widget.params}");
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
                  child: FadeInImage(
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    image: NetworkImage(snapshot.data!.image!),
                    placeholder: const AssetImage('assets/images/berita.png'),
                    imageErrorBuilder: (context, error, stackTrace) => const Image(
                      image: AssetImage('assets/images/berita.png'),
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
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
                        snapshot.data!.tanggal!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        snapshot.data!.content!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
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
          return Shimmer.fromColors(
            baseColor: Colors.grey[900]!,
            highlightColor: Colors.grey[600]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.black12,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.black12,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
