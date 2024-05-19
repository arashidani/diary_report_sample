// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Projects _$ProjectsFromJson(Map<String, dynamic> json) {
  return _Projects.fromJson(json);
}

/// @nodoc
mixin _$Projects {
  String get id => throw _privateConstructorUsedError;
  double get business => throw _privateConstructorUsedError;
  double get over => throw _privateConstructorUsedError;
  double get late => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectsCopyWith<Projects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsCopyWith<$Res> {
  factory $ProjectsCopyWith(Projects value, $Res Function(Projects) then) =
      _$ProjectsCopyWithImpl<$Res, Projects>;
  @useResult
  $Res call(
      {String id,
      double business,
      double over,
      double late,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? updatedAt});
}

/// @nodoc
class _$ProjectsCopyWithImpl<$Res, $Val extends Projects>
    implements $ProjectsCopyWith<$Res> {
  _$ProjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? business = null,
    Object? over = null,
    Object? late = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as double,
      over: null == over
          ? _value.over
          : over // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectsImplCopyWith<$Res>
    implements $ProjectsCopyWith<$Res> {
  factory _$$ProjectsImplCopyWith(
          _$ProjectsImpl value, $Res Function(_$ProjectsImpl) then) =
      __$$ProjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double business,
      double over,
      double late,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? updatedAt});
}

/// @nodoc
class __$$ProjectsImplCopyWithImpl<$Res>
    extends _$ProjectsCopyWithImpl<$Res, _$ProjectsImpl>
    implements _$$ProjectsImplCopyWith<$Res> {
  __$$ProjectsImplCopyWithImpl(
      _$ProjectsImpl _value, $Res Function(_$ProjectsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? business = null,
    Object? over = null,
    Object? late = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProjectsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as double,
      over: null == over
          ? _value.over
          : over // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectsImpl implements _Projects {
  const _$ProjectsImpl(
      {required this.id,
      required this.business,
      required this.over,
      required this.late,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      this.createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      this.updatedAt});

  factory _$ProjectsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectsImplFromJson(json);

  @override
  final String id;
  @override
  final double business;
  @override
  final double over;
  @override
  final double late;
  @override
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Projects(id: $id, business: $business, over: $over, late: $late, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.over, over) || other.over == over) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, business, over, late, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsImplCopyWith<_$ProjectsImpl> get copyWith =>
      __$$ProjectsImplCopyWithImpl<_$ProjectsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectsImplToJson(
      this,
    );
  }
}

abstract class _Projects implements Projects {
  const factory _Projects(
      {required final String id,
      required final double business,
      required final double over,
      required final double late,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? updatedAt}) = _$ProjectsImpl;

  factory _Projects.fromJson(Map<String, dynamic> json) =
      _$ProjectsImpl.fromJson;

  @override
  String get id;
  @override
  double get business;
  @override
  double get over;
  @override
  double get late;
  @override
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProjectsImplCopyWith<_$ProjectsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
