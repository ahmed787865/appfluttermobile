
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@Freezed()
class Teacher with _$Teacher {
  const factory Teacher({
    String ? id,
    String ? name,
    String ? phone,
    DateTime ? joined,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}
