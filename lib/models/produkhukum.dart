// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jdih/models/kategori.dart';

part 'produkhukum.freezed.dart';
part 'produkhukum.g.dart';

@freezed
class ProdukHukum with _$ProdukHukum {
  const factory ProdukHukum({
    @JsonKey(name: 'prod_id', defaultValue: 0) int? id,
    @JsonKey(name: 'prod_judul', defaultValue: "") String? judul,
    @JsonKey(name: 'prod_url_lampiran', defaultValue: "") String? urlLampiran,
    @JsonKey(name: 'prod_no', defaultValue: "") String? no,
    @JsonKey(name: 'prod_deskripsi', defaultValue: "") String? deskripsi,
    @JsonKey(name: 'prod_url_abstrak', defaultValue: "") String? abstrak,
    @JsonKey(name: 'prod_tahun', defaultValue: "") String? tahun,
    @JsonKey(name: 'prod_tanggal', defaultValue: "") String? tanggal,
    @JsonKey(name: 'prod_teu_pengarang', defaultValue: "") String? teuBadan,
    @JsonKey(name: 'prod_sumber', defaultValue: "") String? sumber,
    @JsonKey(name: 'prod_tempat', defaultValue: "") String? tempatTerbit,
    @JsonKey(name: 'prod_bidanghukum', defaultValue: "") String? bidangHukum,
    @JsonKey(name: 'prod_subjek', defaultValue: "") String? subjek,
    @JsonKey(name: 'prod_bahasa', defaultValue: "") String? bahasa,
    @JsonKey(name: 'prod_lokasi', defaultValue: "") String? lokasi,
    @JsonKey(name: 'prod_status', defaultValue: "") String? status,
    @JsonKey(name: 'prod_url', defaultValue: "") String? url,
    @JsonKey(name: 'prod_nama_file', defaultValue: "") String? namaFile,
    @JsonKey(name: 'kategori') Kategori? kategori,
  }) = _ProdukHukum;

  factory ProdukHukum.fromJson(Map<String, dynamic> json) =>
      _$ProdukHukumFromJson(json);
}
