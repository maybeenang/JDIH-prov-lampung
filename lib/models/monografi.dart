// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monografi.freezed.dart';
part 'monografi.g.dart';

@freezed
class Monografi with _$Monografi {
  const factory Monografi({
    @JsonKey(name: 'id', defaultValue: "") String? id,
    @JsonKey(name: 'title', defaultValue: "") String? title,
    @JsonKey(name: 'image', defaultValue: "") String? image,
    @JsonKey(name: 'url', defaultValue: "") String? url,
    @JsonKey(name: 'createdAt', defaultValue: "") String? date,
  }) = _Monografi;

  factory Monografi.fromJson(Map<String, dynamic> json) => _$MonografiFromJson(json);
}
