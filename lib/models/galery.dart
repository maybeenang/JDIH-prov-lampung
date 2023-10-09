// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'galery.freezed.dart';
part 'galery.g.dart';

@freezed
abstract class Galery with _$Galery {
  const factory Galery({
    @JsonKey(name: 'id', defaultValue: "") String? id,
    @JsonKey(name: 'title', defaultValue: "") String? title,
    @JsonKey(name: 'videoUrl', defaultValue: "") String? content,
    @JsonKey(name: 'image', defaultValue: "") String? tanggal,
    @JsonKey(name: 'createdAt', defaultValue: "") String? date,
  }) = _Galery;

  factory Galery.fromJson(Map<String, dynamic> json) => _$GaleryFromJson(json);
}
