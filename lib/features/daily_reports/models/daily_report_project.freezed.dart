// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReportProject {
  String get docId;
  double get business;
  double get late;
  double get over;
  @TimeStampConverter()
  DateTime? get createdAt;
  @TimeStampConverter()
  DateTime? get updatedAt;

  /// Create a copy of DailyReportProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyReportProjectCopyWith<DailyReportProject> get copyWith =>
      _$DailyReportProjectCopyWithImpl<DailyReportProject>(
          this as DailyReportProject, _$identity);

  /// Serializes this DailyReportProject to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyReportProject &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.over, over) || other.over == over) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, docId, business, late, over, createdAt, updatedAt);

  @override
  String toString() {
    return 'DailyReportProject(docId: $docId, business: $business, late: $late, over: $over, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DailyReportProjectCopyWith<$Res> {
  factory $DailyReportProjectCopyWith(
          DailyReportProject value, $Res Function(DailyReportProject) _then) =
      _$DailyReportProjectCopyWithImpl;
  @useResult
  $Res call(
      {String docId,
      double business,
      double late,
      double over,
      @TimeStampConverter() DateTime? createdAt,
      @TimeStampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$DailyReportProjectCopyWithImpl<$Res>
    implements $DailyReportProjectCopyWith<$Res> {
  _$DailyReportProjectCopyWithImpl(this._self, this._then);

  final DailyReportProject _self;
  final $Res Function(DailyReportProject) _then;

  /// Create a copy of DailyReportProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? business = null,
    Object? late = null,
    Object? over = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _self.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      over: null == over
          ? _self.over
          : over // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DailyReportProject implements DailyReportProject {
  const _DailyReportProject(
      {this.docId = '',
      this.business = 0.0,
      this.late = 0.0,
      this.over = 0.0,
      @TimeStampConverter() this.createdAt,
      @TimeStampConverter() this.updatedAt});
  factory _DailyReportProject.fromJson(Map<String, dynamic> json) =>
      _$DailyReportProjectFromJson(json);

  @override
  @JsonKey()
  final String docId;
  @override
  @JsonKey()
  final double business;
  @override
  @JsonKey()
  final double late;
  @override
  @JsonKey()
  final double over;
  @override
  @TimeStampConverter()
  final DateTime? createdAt;
  @override
  @TimeStampConverter()
  final DateTime? updatedAt;

  /// Create a copy of DailyReportProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyReportProjectCopyWith<_DailyReportProject> get copyWith =>
      __$DailyReportProjectCopyWithImpl<_DailyReportProject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyReportProjectToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyReportProject &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.over, over) || other.over == over) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, docId, business, late, over, createdAt, updatedAt);

  @override
  String toString() {
    return 'DailyReportProject(docId: $docId, business: $business, late: $late, over: $over, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DailyReportProjectCopyWith<$Res>
    implements $DailyReportProjectCopyWith<$Res> {
  factory _$DailyReportProjectCopyWith(
          _DailyReportProject value, $Res Function(_DailyReportProject) _then) =
      __$DailyReportProjectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String docId,
      double business,
      double late,
      double over,
      @TimeStampConverter() DateTime? createdAt,
      @TimeStampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$DailyReportProjectCopyWithImpl<$Res>
    implements _$DailyReportProjectCopyWith<$Res> {
  __$DailyReportProjectCopyWithImpl(this._self, this._then);

  final _DailyReportProject _self;
  final $Res Function(_DailyReportProject) _then;

  /// Create a copy of DailyReportProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? docId = null,
    Object? business = null,
    Object? late = null,
    Object? over = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_DailyReportProject(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _self.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      over: null == over
          ? _self.over
          : over // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
