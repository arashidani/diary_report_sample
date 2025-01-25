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
  String get docId => throw _privateConstructorUsedError;
  Map<String, double> get holidays => throw _privateConstructorUsedError;
  bool get isApproval => throw _privateConstructorUsedError;
  double get absentOrLeft => throw _privateConstructorUsedError;
  bool get hasSubstituteHoliday => throw _privateConstructorUsedError;
  List<ProjectReports> get projects => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Reports to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reports
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportsCopyWith<Reports> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsCopyWith<$Res> {
  factory $ReportsCopyWith(Reports value, $Res Function(Reports) then) =
      _$ReportsCopyWithImpl<$Res, Reports>;
  @useResult
  $Res call(
      {String docId,
      Map<String, double> holidays,
      bool isApproval,
      double absentOrLeft,
      bool hasSubstituteHoliday,
      List<ProjectReports> projects,
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

  /// Create a copy of Reports
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? holidays = null,
    Object? isApproval = null,
    Object? absentOrLeft = null,
    Object? hasSubstituteHoliday = null,
    Object? projects = null,
    Object? date = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      holidays: null == holidays
          ? _value.holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      isApproval: null == isApproval
          ? _value.isApproval
          : isApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      absentOrLeft: null == absentOrLeft
          ? _value.absentOrLeft
          : absentOrLeft // ignore: cast_nullable_to_non_nullable
              as double,
      hasSubstituteHoliday: null == hasSubstituteHoliday
          ? _value.hasSubstituteHoliday
          : hasSubstituteHoliday // ignore: cast_nullable_to_non_nullable
              as bool,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectReports>,
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
      {String docId,
      Map<String, double> holidays,
      bool isApproval,
      double absentOrLeft,
      bool hasSubstituteHoliday,
      List<ProjectReports> projects,
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

  /// Create a copy of Reports
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? holidays = null,
    Object? isApproval = null,
    Object? absentOrLeft = null,
    Object? hasSubstituteHoliday = null,
    Object? projects = null,
    Object? date = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReportsImpl(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      holidays: null == holidays
          ? _value._holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      isApproval: null == isApproval
          ? _value.isApproval
          : isApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      absentOrLeft: null == absentOrLeft
          ? _value.absentOrLeft
          : absentOrLeft // ignore: cast_nullable_to_non_nullable
              as double,
      hasSubstituteHoliday: null == hasSubstituteHoliday
          ? _value.hasSubstituteHoliday
          : hasSubstituteHoliday // ignore: cast_nullable_to_non_nullable
              as bool,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectReports>,
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
      {this.docId = '',
      final Map<String, double> holidays = const {},
      this.isApproval = false,
      this.absentOrLeft = 0,
      this.hasSubstituteHoliday = false,
      final List<ProjectReports> projects = const [],
      @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
      this.date,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      this.createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      this.updatedAt})
      : _holidays = holidays,
        _projects = projects;

  factory _$ReportsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportsImplFromJson(json);

  @override
  @JsonKey()
  final String docId;
  final Map<String, double> _holidays;
  @override
  @JsonKey()
  Map<String, double> get holidays {
    if (_holidays is EqualUnmodifiableMapView) return _holidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_holidays);
  }

  @override
  @JsonKey()
  final bool isApproval;
  @override
  @JsonKey()
  final double absentOrLeft;
  @override
  @JsonKey()
  final bool hasSubstituteHoliday;
  final List<ProjectReports> _projects;
  @override
  @JsonKey()
  List<ProjectReports> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? date;
  @override
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Reports(docId: $docId, holidays: $holidays, isApproval: $isApproval, absentOrLeft: $absentOrLeft, hasSubstituteHoliday: $hasSubstituteHoliday, projects: $projects, date: $date, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            const DeepCollectionEquality().equals(other._holidays, _holidays) &&
            (identical(other.isApproval, isApproval) ||
                other.isApproval == isApproval) &&
            (identical(other.absentOrLeft, absentOrLeft) ||
                other.absentOrLeft == absentOrLeft) &&
            (identical(other.hasSubstituteHoliday, hasSubstituteHoliday) ||
                other.hasSubstituteHoliday == hasSubstituteHoliday) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      docId,
      const DeepCollectionEquality().hash(_holidays),
      isApproval,
      absentOrLeft,
      hasSubstituteHoliday,
      const DeepCollectionEquality().hash(_projects),
      date,
      createdAt,
      updatedAt);

  /// Create a copy of Reports
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {final String docId,
      final Map<String, double> holidays,
      final bool isApproval,
      final double absentOrLeft,
      final bool hasSubstituteHoliday,
      final List<ProjectReports> projects,
      @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? date,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? updatedAt}) = _$ReportsImpl;

  factory _Reports.fromJson(Map<String, dynamic> json) = _$ReportsImpl.fromJson;

  @override
  String get docId;
  @override
  Map<String, double> get holidays;
  @override
  bool get isApproval;
  @override
  double get absentOrLeft;
  @override
  bool get hasSubstituteHoliday;
  @override
  List<ProjectReports> get projects;
  @override
  @JsonKey(name: 'date', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get date;
  @override
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt;

  /// Create a copy of Reports
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsImplCopyWith<_$ReportsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
