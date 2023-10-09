import 'package:jdih/models/artikel.dart';
import 'package:dio/dio.dart';
import 'package:jdih/constants/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artikel_controller.g.dart';

@riverpod
class ArtikelController extends _$ArtikelController {
  final Dio dio = Dio();

  @override
  FutureOr<List<Artikel>?> build() {
    return initialFetchArtikel();
  }

  Future<List<Artikel>?> initialFetchArtikel() async {
    final initialArtikel = await AsyncValue.guard<List<Artikel>>(
      () async {
        try {
          final Uri uri = Uri.parse(EndPoint.endpointBaseUrl + EndPoint.artikelEndpoint);
          final response = await dio.get(
            uri.toString(),
          );

          final List<Artikel> artikel = (response.data as List).map((e) => Artikel.fromJson(e)).toList();

          return artikel;
        } on DioException catch (e) {
          print("DIo $e");
          return Future.error(e.message ?? 'Terjadi kesalahan');
        } catch (e) {
          print("error $e");
          return Future.error(e.toString());
        }
      },
    );
    return initialArtikel.maybeWhen(
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
