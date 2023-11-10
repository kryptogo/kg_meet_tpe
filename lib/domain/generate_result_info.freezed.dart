// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_result_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenerateResultInfo _$GenerateResultInfoFromJson(Map<String, dynamic> json) {
  return _GenerateResultInfo.fromJson(json);
}

/// @nodoc
mixin _$GenerateResultInfo {
  String get name => throw _privateConstructorUsedError;
  String get birth => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get privateKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateResultInfoCopyWith<GenerateResultInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateResultInfoCopyWith<$Res> {
  factory $GenerateResultInfoCopyWith(
          GenerateResultInfo value, $Res Function(GenerateResultInfo) then) =
      _$GenerateResultInfoCopyWithImpl<$Res, GenerateResultInfo>;
  @useResult
  $Res call({String name, String birth, String address, String privateKey});
}

/// @nodoc
class _$GenerateResultInfoCopyWithImpl<$Res, $Val extends GenerateResultInfo>
    implements $GenerateResultInfoCopyWith<$Res> {
  _$GenerateResultInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birth = null,
    Object? address = null,
    Object? privateKey = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birth: null == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateResultInfoImplCopyWith<$Res>
    implements $GenerateResultInfoCopyWith<$Res> {
  factory _$$GenerateResultInfoImplCopyWith(_$GenerateResultInfoImpl value,
          $Res Function(_$GenerateResultInfoImpl) then) =
      __$$GenerateResultInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String birth, String address, String privateKey});
}

/// @nodoc
class __$$GenerateResultInfoImplCopyWithImpl<$Res>
    extends _$GenerateResultInfoCopyWithImpl<$Res, _$GenerateResultInfoImpl>
    implements _$$GenerateResultInfoImplCopyWith<$Res> {
  __$$GenerateResultInfoImplCopyWithImpl(_$GenerateResultInfoImpl _value,
      $Res Function(_$GenerateResultInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birth = null,
    Object? address = null,
    Object? privateKey = null,
  }) {
    return _then(_$GenerateResultInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birth: null == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateResultInfoImpl implements _GenerateResultInfo {
  const _$GenerateResultInfoImpl(
      {required this.name,
      required this.birth,
      required this.address,
      required this.privateKey});

  factory _$GenerateResultInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateResultInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String birth;
  @override
  final String address;
  @override
  final String privateKey;

  @override
  String toString() {
    return 'GenerateResultInfo(name: $name, birth: $birth, address: $address, privateKey: $privateKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateResultInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birth, birth) || other.birth == birth) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, birth, address, privateKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateResultInfoImplCopyWith<_$GenerateResultInfoImpl> get copyWith =>
      __$$GenerateResultInfoImplCopyWithImpl<_$GenerateResultInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateResultInfoImplToJson(
      this,
    );
  }
}

abstract class _GenerateResultInfo implements GenerateResultInfo {
  const factory _GenerateResultInfo(
      {required final String name,
      required final String birth,
      required final String address,
      required final String privateKey}) = _$GenerateResultInfoImpl;

  factory _GenerateResultInfo.fromJson(Map<String, dynamic> json) =
      _$GenerateResultInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get birth;
  @override
  String get address;
  @override
  String get privateKey;
  @override
  @JsonKey(ignore: true)
  _$$GenerateResultInfoImplCopyWith<_$GenerateResultInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
