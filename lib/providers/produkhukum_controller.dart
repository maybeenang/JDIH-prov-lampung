import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jdih/constants/api.dart';
import 'package:jdih/models/produkhukum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'produkhukum_controller.g.dart';

@riverpod
class ProdukHukumController extends _$ProdukHukumController {
  final Dio dio = Dio();

  @override
  Future<List<ProdukHukum>?> build() {
    return _initialFetchProdukHukum();
  }

  Future<List<ProdukHukum>?> _initialFetchProdukHukum() async {
    state = const AsyncValue.loading();
    final initialProdukHukum = await AsyncValue.guard<List<ProdukHukum>>(
      () async {
        try {
          final Uri uri = Uri.parse(
            EndPoint.produkHukumBaseUrl + EndPoint.produkHukum,
          );
          final response = await dio.get(
            uri.toString(),
            options: Options(
              headers: {
                "X-AUTHORIZATION": dotenv.env['API_KEY'].toString(),
              },
            ),
          );

          final List<ProdukHukum> produkHukum =
              (response.data["data"]["data"] as List)
                  .map((e) => ProdukHukum.fromJson(e))
                  .toList();

          return produkHukum;
        } on DioException catch (e) {
          return Future.error(e.message ?? 'Terjadi kesalahan');
        } catch (e) {
          return Future.error(e.toString());
        }
      },
    );
    return initialProdukHukum.maybeWhen(
      orElse: () => null,
      data: (data) {
        return data;
      },
      error: (error, stackTrace) {
        return null;
      },
    );
  }
}
