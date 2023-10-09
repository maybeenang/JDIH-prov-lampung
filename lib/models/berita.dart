// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'berita.freezed.dart';
part 'berita.g.dart';

@freezed
class Berita with _$Berita {
  const factory Berita({
    @JsonKey(name: 'id', defaultValue: "") String? id,
    @JsonKey(name: 'title', defaultValue: "") String? title,
    @JsonKey(name: 'content', defaultValue: "") String? content,
    @JsonKey(name: 'image', defaultValue: "") String? image,
    @JsonKey(name: 'dilihat', defaultValue: 0) int? dilihat,
    @JsonKey(name: 'tanggal', defaultValue: "") String? tanggal,
    @JsonKey(name: 'createdAt', defaultValue: "") String? date,
  }) = _Berita;

  factory Berita.fromJson(Map<String, dynamic> json) => _$BeritaFromJson(json);
}
