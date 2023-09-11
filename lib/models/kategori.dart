// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kategori.freezed.dart';
part 'kategori.g.dart';

@freezed
class Kategori with _$Kategori {
  const factory Kategori({
    @JsonKey(name: 'cat_id', defaultValue: 0) int? id,
    @JsonKey(name: 'category', defaultValue: "") String? category,
    @JsonKey(name: 'singkatan', defaultValue: "") String? singkatan,
  }) = _Kategori;

  factory Kategori.fromJson(Map<String, dynamic> json) =>
      _$KategoriFromJson(json);
}
