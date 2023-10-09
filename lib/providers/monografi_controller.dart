import 'package:jdih/models/monografi.dart';
import 'package:dio/dio.dart';
import 'package:jdih/constants/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'monografi_controller.g.dart';

@riverpod
class MonografiController extends _$MonografiController {
  final Dio dio = Dio();

  @override
  FutureOr<List<Monografi>?> build() {
    return initialFetchMonografi();
  }

  Future<List<Monografi>?> initialFetchMonografi() async {
    final initialMonografi = await AsyncValue.guard<List<Monografi>>(
      () async {
        try {
          final Uri uri = Uri.parse(EndPoint.endpointBaseUrl + EndPoint.monografiEndpoint);
          final response = await dio.get(
            uri.toString(),
          );

          final List<Monografi> monografi = (response.data as List).map((e) => Monografi.fromJson(e)).toList();

          return monografi;
        } on DioException catch (e) {
          print("DIo $e");
          return Future.error(e.message ?? 'Terjadi kesalahan');
        } catch (e) {
          print("error $e");
          return Future.error(e.toString());
        }
      },
    );
    return initialMonografi.maybeWhen(
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
