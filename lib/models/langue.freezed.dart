// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'langue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Langue _$LangueFromJson(Map<String, dynamic> json) {
  return _Langue.fromJson(json);
}

/// @nodoc
mixin _$Langue {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LangueCopyWith<Langue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangueCopyWith<$Res> {
  factory $LangueCopyWith(Langue value, $Res Function(Langue) then) =
      _$LangueCopyWithImpl<$Res, Langue>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$LangueCopyWithImpl<$Res, $Val extends Langue>
    implements $LangueCopyWith<$Res> {
  _$LangueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LangueImplCopyWith<$Res> implements $LangueCopyWith<$Res> {
  factory _$$LangueImplCopyWith(
          _$LangueImpl value, $Res Function(_$LangueImpl) then) =
      __$$LangueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$LangueImplCopyWithImpl<$Res>
    extends _$LangueCopyWithImpl<$Res, _$LangueImpl>
    implements _$$LangueImplCopyWith<$Res> {
  __$$LangueImplCopyWithImpl(
      _$LangueImpl _value, $Res Function(_$LangueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$LangueImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LangueImpl implements _Langue {
  const _$LangueImpl({this.id, this.name});

  factory _$LangueImpl.fromJson(Map<String, dynamic> json) =>
      _$$LangueImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Langue(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LangueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LangueImplCopyWith<_$LangueImpl> get copyWith =>
      __$$LangueImplCopyWithImpl<_$LangueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LangueImplToJson(
      this,
    );
  }
}

abstract class _Langue implements Langue {
  const factory _Langue({final String? id, final String? name}) = _$LangueImpl;

  factory _Langue.fromJson(Map<String, dynamic> json) = _$LangueImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$LangueImplCopyWith<_$LangueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
