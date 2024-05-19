// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reports _$ReportsFromJson(Map<String, dynamic> json) {
  return _Reports.fromJson(json);
}

/// @nodoc
mixin _$Reports {
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get holidays => throw _privateConstructorUsedError;
  bool get isApproval => throw _privateConstructorUsedError;
  double get absentOrLeft => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get date => throw _privateConstructorUsedError; // TODO: あとで追加する
// bool hasSubstituteHoliday,
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportsCopyWith<Reports> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsCopyWith<$Res> {
  factory $ReportsCopyWith(Reports value, $Res Function(Reports) then) =
      _$ReportsCopyWithImpl<$Res, Reports>;
  @useResult
  $Res call(
      {String id,
      Map<String, dynamic> holidays,
      bool isApproval,
      double absentOrLeft,
      String projectId,
      @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? date,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? updatedAt});
}

/// @nodoc
class _$ReportsCopyWithImpl<$Res, $Val extends Reports>
    implements $ReportsCopyWith<$Res> {
  _$ReportsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? holidays = null,
    Object? isApproval = null,
    Object? absentOrLeft = null,
    Object? projectId = null,
    Object? date = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      holidays: null == holidays
          ? _value.holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isApproval: null == isApproval
          ? _value.isApproval
          : isApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      absentOrLeft: null == absentOrLeft
          ? _value.absentOrLeft
          : absentOrLeft // ignore: cast_nullable_to_non_nullable
              as double,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$ReportsImplCopyWith<$Res> implements $ReportsCopyWith<$Res> {
  factory _$$ReportsImplCopyWith(
          _$ReportsImpl value, $Res Function(_$ReportsImpl) then) =
      __$$ReportsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<String, dynamic> holidays,
      bool isApproval,
      double absentOrLeft,
      String projectId,
      @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? date,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? updatedAt});
}

/// @nodoc
class __$$ReportsImplCopyWithImpl<$Res>
    extends _$ReportsCopyWithImpl<$Res, _$ReportsImpl>
    implements _$$ReportsImplCopyWith<$Res> {
  __$$ReportsImplCopyWithImpl(
      _$ReportsImpl _value, $Res Function(_$ReportsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? holidays = null,
    Object? isApproval = null,
    Object? absentOrLeft = null,
    Object? projectId = null,
    Object? date = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReportsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      holidays: null == holidays
          ? _value._holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isApproval: null == isApproval
          ? _value.isApproval
          : isApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      absentOrLeft: null == absentOrLeft
          ? _value.absentOrLeft
          : absentOrLeft // ignore: cast_nullable_to_non_nullable
              as double,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$ReportsImpl implements _Reports {
  const _$ReportsImpl(
      {required this.id,
      required final Map<String, dynamic> holidays,
      required this.isApproval,
      required this.absentOrLeft,
      required this.projectId,
      @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
      this.date,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      this.createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      this.updatedAt})
      : _holidays = holidays;

  factory _$ReportsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportsImplFromJson(json);

  @override
  final String id;
  final Map<String, dynamic> _holidays;
  @override
  Map<String, dynamic> get holidays {
    if (_holidays is EqualUnmodifiableMapView) return _holidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_holidays);
  }

  @override
  final bool isApproval;
  @override
  final double absentOrLeft;
  @override
  final String projectId;
  @override
  @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? date;
// TODO: あとで追加する
// bool hasSubstituteHoliday,
  @override
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Reports(id: $id, holidays: $holidays, isApproval: $isApproval, absentOrLeft: $absentOrLeft, projectId: $projectId, date: $date, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._holidays, _holidays) &&
            (identical(other.isApproval, isApproval) ||
                other.isApproval == isApproval) &&
            (identical(other.absentOrLeft, absentOrLeft) ||
                other.absentOrLeft == absentOrLeft) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_holidays),
      isApproval,
      absentOrLeft,
      projectId,
      date,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsImplCopyWith<_$ReportsImpl> get copyWith =>
      __$$ReportsImplCopyWithImpl<_$ReportsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportsImplToJson(
      this,
    );
  }
}

abstract class _Reports implements Reports {
  const factory _Reports(
      {required final String id,
      required final Map<String, dynamic> holidays,
      required final bool isApproval,
      required final double absentOrLeft,
      required final String projectId,
      @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? date,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? updatedAt}) = _$ReportsImpl;

  factory _Reports.fromJson(Map<String, dynamic> json) = _$ReportsImpl.fromJson;

  @override
  String get id;
  @override
  Map<String, dynamic> get holidays;
  @override
  bool get isApproval;
  @override
  double get absentOrLeft;
  @override
  String get projectId;
  @override
  @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get date;
  @override // TODO: あとで追加する
// bool hasSubstituteHoliday,
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ReportsImplCopyWith<_$ReportsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
