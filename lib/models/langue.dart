

import 'package:freezed_annotation/freezed_annotation.dart';


part 'langue.freezed.dart';
part 'langue.g.dart';


@Freezed()
class Langue with _$Langue {
  const factory Langue({
    String ? id,
    String ? name,
  }) = _Langue;

  factory Langue.fromJson(Map<String, dynamic> json) => _$LangueFromJson(json);
}
