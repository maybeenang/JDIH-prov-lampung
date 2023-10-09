// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'artikel.freezed.dart';
part 'artikel.g.dart';

@freezed
abstract class Artikel with _$Artikel {
  const factory Artikel({
    @JsonKey(name: 'id', defaultValue: "") String? id,
    @JsonKey(name: 'title', defaultValue: "") String? title,
    @JsonKey(name: 'content', defaultValue: "") String? content,
    @JsonKey(name: 'tanggal', defaultValue: "") String? tanggal,
    @JsonKey(name: 'documentUrl', defaultValue: "") String? documentUrl,
    @JsonKey(name: 'createdAt', defaultValue: "") String? date,
  }) = _Artikel;

  factory Artikel.fromJson(Map<String, dynamic> json) => _$ArtikelFromJson(json);
}
