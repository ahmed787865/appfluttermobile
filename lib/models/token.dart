import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@Freezed()
class Token with _$Token {
  const factory Token({
    String ? refreshToken,
    String ? accessToken
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
