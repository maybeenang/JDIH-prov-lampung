import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jdih/models/produkhukum_model.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'produkhukum_event.dart';
part 'produkhukum_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ProdukhukumBloc extends Bloc<ProdukhukumEvent, ProdukhukumState> {
  ProdukhukumBloc({required this.httpClient})
      : super(const ProdukhukumState()) {
    on<ProdukhukumFetched>(
      _onProdukhukumFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onProdukhukumFetched(
      ProdukhukumFetched event, Emitter<ProdukhukumState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == ProdukhukumStatus.initial) {
        final produkHukum = await _fetchProdukHukum();
        return emit(
          state.copyWith(
            status: ProdukhukumStatus.success,
            produkHukum: produkHukum,
            hasReachedMax: false,
          ),
        );
      }

      final produkHukum = await _fetchProdukHukum(state.produkHukum.length);
      emit(produkHukum.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: ProdukhukumStatus.success,
              produkHukum: List.of(state.produkHukum)..addAll(produkHukum),
              hasReachedMax: false,
            ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: ProdukhukumStatus.failure));
    }
  }

  Future<List<ProdukHukum>> _fetchProdukHukum([int startIndex = 0]) async {
    startIndex = startIndex + 1;
    final response = await http.get(
        Uri.http(dotenv.env['BASE_URL'].toString(),
            "produk-hukum?page=$startIndex&order=DESC"),
        headers: {
          'X-AUTHORIZATION': dotenv.env['API_KEY'].toString(),
        });
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("success");
      final body = json.decode(response.body)['data']['data'] as List;

      return body.map((dynamic json) {
        return ProdukHukum(
          url_lampiran: json['prod_url_lampiran'],
          judul: json['kategori']['category'] +
              " No." +
              json['prod_no'] +
              " Tahun " +
              json['prod_tahun'] +
              " Tentang " +
              json['prod_judul'],
          deskripsi: json['prod_deskripsi'],
          abstrak: json['prod_url_abstrak'],
          jenisPeraturan: json['kategori']['category'],
          noPeraturan: json['prod_no'],
          tahunTerbit: json['prod_tahun'],
          tanggal: json['prod_tanggal'],
          teuBadan: json['prod_teu_pengarang'],
          sumber: json['prod_sumber'],
          tempatTerbit: json['prod_tempat'],
          bidangHukum: json['prod_bidanghukum'],
          subjek: json['prod_subjek'],
          bahasa: json['prod_bahasa'],
          lokasi: json['prod_lokasi'],
          status: json['prod_status'],
        );
      }).toList();
    } else {
      throw Exception('error fetching produk hukum');
    }
  }
}
