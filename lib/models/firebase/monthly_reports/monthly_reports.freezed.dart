// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonthlyReports _$MonthlyReportsFromJson(Map<String, dynamic> json) {
  return _MonthlyReports.fromJson(json);
}

/// @nodoc
mixin _$MonthlyReports {
  String get docId => throw _privateConstructorUsedError;
  List<ProjectReports> get projects => throw _privateConstructorUsedError;
  int get sectionId => throw _privateConstructorUsedError;
  double get totalBusiness => throw _privateConstructorUsedError;
  double get totalOver => throw _privateConstructorUsedError;
  double get totalLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get initialDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlyReportsCopyWith<MonthlyReports> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyReportsCopyWith<$Res> {
  factory $MonthlyReportsCopyWith(
          MonthlyReports value, $Res Function(MonthlyReports) then) =
      _$MonthlyReportsCopyWithImpl<$Res, MonthlyReports>;
  @useResult
  $Res call(
      {String docId,
      List<ProjectReports> projects,
      int sectionId,
      double totalBusiness,
      double totalOver,
      double totalLate,
      @JsonKey(
          name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? initialDate,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? updatedAt});
}

/// @nodoc
class _$MonthlyReportsCopyWithImpl<$Res, $Val extends MonthlyReports>
    implements $MonthlyReportsCopyWith<$Res> {
  _$MonthlyReportsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? projects = null,
    Object? sectionId = null,
    Object? totalBusiness = null,
    Object? totalOver = null,
    Object? totalLate = null,
    Object? initialDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectReports>,
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int,
      totalBusiness: null == totalBusiness
          ? _value.totalBusiness
          : totalBusiness // ignore: cast_nullable_to_non_nullable
              as double,
      totalOver: null == totalOver
          ? _value.totalOver
          : totalOver // ignore: cast_nullable_to_non_nullable
              as double,
      totalLate: null == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as double,
      initialDate: freezed == initialDate
          ? _value.initialDate
          : initialDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MonthlyReportsImplCopyWith<$Res>
    implements $MonthlyReportsCopyWith<$Res> {
  factory _$$MonthlyReportsImplCopyWith(_$MonthlyReportsImpl value,
          $Res Function(_$MonthlyReportsImpl) then) =
      __$$MonthlyReportsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String docId,
      List<ProjectReports> projects,
      int sectionId,
      double totalBusiness,
      double totalOver,
      double totalLate,
      @JsonKey(
          name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? initialDate,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      DateTime? updatedAt});
}

/// @nodoc
class __$$MonthlyReportsImplCopyWithImpl<$Res>
    extends _$MonthlyReportsCopyWithImpl<$Res, _$MonthlyReportsImpl>
    implements _$$MonthlyReportsImplCopyWith<$Res> {
  __$$MonthlyReportsImplCopyWithImpl(
      _$MonthlyReportsImpl _value, $Res Function(_$MonthlyReportsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? projects = null,
    Object? sectionId = null,
    Object? totalBusiness = null,
    Object? totalOver = null,
    Object? totalLate = null,
    Object? initialDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MonthlyReportsImpl(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectReports>,
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int,
      totalBusiness: null == totalBusiness
          ? _value.totalBusiness
          : totalBusiness // ignore: cast_nullable_to_non_nullable
              as double,
      totalOver: null == totalOver
          ? _value.totalOver
          : totalOver // ignore: cast_nullable_to_non_nullable
              as double,
      totalLate: null == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as double,
      initialDate: freezed == initialDate
          ? _value.initialDate
          : initialDate // ignore: cast_nullable_to_non_nullable
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
class _$MonthlyReportsImpl implements _MonthlyReports {
  const _$MonthlyReportsImpl(
      {this.docId = '',
      final List<ProjectReports> projects = const [],
      this.sectionId = 0,
      this.totalBusiness = 0,
      this.totalOver = 0,
      this.totalLate = 0,
      @JsonKey(
          name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
      this.initialDate,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      this.createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      this.updatedAt})
      : _projects = projects;

  factory _$MonthlyReportsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyReportsImplFromJson(json);

  @override
  @JsonKey()
  final String docId;
  final List<ProjectReports> _projects;
  @override
  @JsonKey()
  List<ProjectReports> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  @JsonKey()
  final int sectionId;
  @override
  @JsonKey()
  final double totalBusiness;
  @override
  @JsonKey()
  final double totalOver;
  @override
  @JsonKey()
  final double totalLate;
  @override
  @JsonKey(name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? initialDate;
  @override
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MonthlyReports(docId: $docId, projects: $projects, sectionId: $sectionId, totalBusiness: $totalBusiness, totalOver: $totalOver, totalLate: $totalLate, initialDate: $initialDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyReportsImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.totalBusiness, totalBusiness) ||
                other.totalBusiness == totalBusiness) &&
            (identical(other.totalOver, totalOver) ||
                other.totalOver == totalOver) &&
            (identical(other.totalLate, totalLate) ||
                other.totalLate == totalLate) &&
            (identical(other.initialDate, initialDate) ||
                other.initialDate == initialDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      docId,
      const DeepCollectionEquality().hash(_projects),
      sectionId,
      totalBusiness,
      totalOver,
      totalLate,
      initialDate,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyReportsImplCopyWith<_$MonthlyReportsImpl> get copyWith =>
      __$$MonthlyReportsImplCopyWithImpl<_$MonthlyReportsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyReportsImplToJson(
      this,
    );
  }
}

abstract class _MonthlyReports implements MonthlyReports {
  const factory _MonthlyReports(
      {final String docId,
      final List<ProjectReports> projects,
      final int sectionId,
      final double totalBusiness,
      final double totalOver,
      final double totalLate,
      @JsonKey(
          name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? initialDate,
      @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? createdAt,
      @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
      final DateTime? updatedAt}) = _$MonthlyReportsImpl;

  factory _MonthlyReports.fromJson(Map<String, dynamic> json) =
      _$MonthlyReportsImpl.fromJson;

  @override
  String get docId;
  @override
  List<ProjectReports> get projects;
  @override
  int get sectionId;
  @override
  double get totalBusiness;
  @override
  double get totalOver;
  @override
  double get totalLate;
  @override
  @JsonKey(name: 'initialDate', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get initialDate;
  @override
  @JsonKey(name: 'createdAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt', fromJson: TimestampConverter.fromJsonNullable)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MonthlyReportsImplCopyWith<_$MonthlyReportsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
