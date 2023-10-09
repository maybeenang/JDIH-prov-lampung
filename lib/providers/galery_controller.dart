import 'package:dio/dio.dart';
import 'package:jdih/constants/api.dart';
import 'package:jdih/models/galery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'galery_controller.g.dart';

@riverpod
class GaleryController extends _$GaleryController {
  final Dio dio = Dio();

  @override
  FutureOr<List<Galery>?> build() {
    return initialFetchGalery();
  }

  Future<List<Galery>?> initialFetchGalery() async {
    final initialGalery = await AsyncValue.guard<List<Galery>>(
      () async {
        try {
          final Uri uri = Uri.parse(EndPoint.endpointBaseUrl + EndPoint.galeryEndpoint);
          final response = await dio.get(
            uri.toString(),
          );

          final List<Galery> artikel = (response.data as List).map((e) => Galery.fromJson(e)).toList();

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
    return initialGalery.maybeWhen(
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
