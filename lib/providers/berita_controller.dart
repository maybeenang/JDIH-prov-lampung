import 'package:dio/dio.dart';
import 'package:jdih/constants/api.dart';
import 'package:jdih/models/berita.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'berita_controller.g.dart';

@riverpod
class BeritaController extends _$BeritaController {
  final Dio dio = Dio();

  @override
  Future<List<Berita>?> build() {
    return initialFetchBerita();
  }

  Future<List<Berita>?> initialFetchBerita() async {
    state = const AsyncValue.loading();
    final initialBerita = await AsyncValue.guard<List<Berita>>(
      () async {
        try {
          final Uri uri = Uri.parse(EndPoint.beritaBaseUrl + EndPoint.berita);
          final response = await dio.get(
            uri.toString(),
          );

          final List<Berita> berita =
              (response.data as List).map((e) => Berita.fromJson(e)).toList();

          return berita;
        } on DioException catch (e) {
          return Future.error(e.message ?? 'Terjadi kesalahan');
        } catch (e) {
          return Future.error(e.toString());
        }
      },
    );
    return initialBerita.maybeWhen(
      orElse: () => null,
      data: (data) {
        return data;
      },
      error: (error, stackTrace) {
        return null;
      },
    );
  }

  Future<List<Berita>?> fetchBerita() async {
    state = const AsyncValue.loading();
    final berita = await AsyncValue.guard<List<Berita>>(
      () async {
        try {
          final Uri uri = Uri.parse(EndPoint.beritaBaseUrl + EndPoint.berita);
          final response = await dio.get(
            uri.toString(),
          );

          final List<Berita> berita =
              (response.data as List).map((e) => Berita.fromJson(e)).toList();

          return berita;
        } on DioException catch (e) {
          return Future.error(e.message ?? 'Terjadi kesalahan');
        } catch (e) {
          return Future.error(e.toString());
        }
      },
    );
    return berita.maybeWhen(
      orElse: () => null,
      data: (data) {
        return data;
      },
      error: (error, stackTrace) {
        return null;
      },
    );
  }

  Future<void> getBeritaById(String id) async {
    final berita = await AsyncValue.guard<Berita>(
      () async {
        try {
          final Uri uri =
              Uri.parse('${EndPoint.beritaBaseUrl}${EndPoint.berita}/$id');
          final response = await dio.get(
            uri.toString(),
          );

          final Berita berita = Berita.fromJson(response.data);

          return berita;
        } on DioException catch (e) {
          return Future.error(e.message ?? 'Terjadi kesalahan');
        } catch (e) {
          return Future.error(e.toString());
        }
      },
    );

    return berita.maybeWhen(
      orElse: () => null,
      // ignore: void_checks
      data: (data) {
        return data;
      },
      error: (error, stackTrace) {
        return null;
      },
    );
  }
}
