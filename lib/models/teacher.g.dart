// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherImpl _$$TeacherImplFromJson(Map<String, dynamic> json) =>
    _$TeacherImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      joined: json['joined'] == null
          ? null
          : DateTime.parse(json['joined'] as String),
    );

Map<String, dynamic> _$$TeacherImplToJson(_$TeacherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'joined': instance.joined?.toIso8601String(),
    };
