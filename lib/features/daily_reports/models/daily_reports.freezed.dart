// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReports {
  String get docId;
  @TimeStampConverter()
  DateTime? get date;
  bool? get isApproval;
  bool? get hasSubstituteHoliday;
  double get absentOrLeft;
  Map<String, double> get holidays;
  Map<String, DailyReportProject> get dailyReportProjects;
  @TimeStampConverter()
  DateTime? get createdAt;
  @TimeStampConverter()
  DateTime? get updatedAt;

  /// Create a copy of DailyReports
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyReportsCopyWith<DailyReports> get copyWith =>
      _$DailyReportsCopyWithImpl<DailyReports>(
          this as DailyReports, _$identity);

  /// Serializes this DailyReports to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyReports &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isApproval, isApproval) ||
                other.isApproval == isApproval) &&
            (identical(other.hasSubstituteHoliday, hasSubstituteHoliday) ||
                other.hasSubstituteHoliday == hasSubstituteHoliday) &&
            (identical(other.absentOrLeft, absentOrLeft) ||
                other.absentOrLeft == absentOrLeft) &&
            const DeepCollectionEquality().equals(other.holidays, holidays) &&
            const DeepCollectionEquality()
                .equals(other.dailyReportProjects, dailyReportProjects) &&
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
      date,
      isApproval,
      hasSubstituteHoliday,
      absentOrLeft,
      const DeepCollectionEquality().hash(holidays),
      const DeepCollectionEquality().hash(dailyReportProjects),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'DailyReports(docId: $docId, date: $date, isApproval: $isApproval, hasSubstituteHoliday: $hasSubstituteHoliday, absentOrLeft: $absentOrLeft, holidays: $holidays, dailyReportProjects: $dailyReportProjects, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DailyReportsCopyWith<$Res> {
  factory $DailyReportsCopyWith(
          DailyReports value, $Res Function(DailyReports) _then) =
      _$DailyReportsCopyWithImpl;
  @useResult
  $Res call(
      {String docId,
      @TimeStampConverter() DateTime? date,
      bool? isApproval,
      bool? hasSubstituteHoliday,
      double absentOrLeft,
      Map<String, double> holidays,
      Map<String, DailyReportProject> dailyReportProjects,
      @TimeStampConverter() DateTime? createdAt,
      @TimeStampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$DailyReportsCopyWithImpl<$Res> implements $DailyReportsCopyWith<$Res> {
  _$DailyReportsCopyWithImpl(this._self, this._then);

  final DailyReports _self;
  final $Res Function(DailyReports) _then;

  /// Create a copy of DailyReports
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? date = freezed,
    Object? isApproval = freezed,
    Object? hasSubstituteHoliday = freezed,
    Object? absentOrLeft = null,
    Object? holidays = null,
    Object? dailyReportProjects = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApproval: freezed == isApproval
          ? _self.isApproval
          : isApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSubstituteHoliday: freezed == hasSubstituteHoliday
          ? _self.hasSubstituteHoliday
          : hasSubstituteHoliday // ignore: cast_nullable_to_non_nullable
              as bool?,
      absentOrLeft: null == absentOrLeft
          ? _self.absentOrLeft
          : absentOrLeft // ignore: cast_nullable_to_non_nullable
              as double,
      holidays: null == holidays
          ? _self.holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      dailyReportProjects: null == dailyReportProjects
          ? _self.dailyReportProjects
          : dailyReportProjects // ignore: cast_nullable_to_non_nullable
              as Map<String, DailyReportProject>,
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
class _DailyReports implements DailyReports {
  const _DailyReports(
      {this.docId = '',
      @TimeStampConverter() this.date,
      this.isApproval = null,
      this.hasSubstituteHoliday = false,
      this.absentOrLeft = 0.0,
      final Map<String, double> holidays = const {},
      final Map<String, DailyReportProject> dailyReportProjects = const {},
      @TimeStampConverter() this.createdAt,
      @TimeStampConverter() this.updatedAt})
      : _holidays = holidays,
        _dailyReportProjects = dailyReportProjects;
  factory _DailyReports.fromJson(Map<String, dynamic> json) =>
      _$DailyReportsFromJson(json);

  @override
  @JsonKey()
  final String docId;
  @override
  @TimeStampConverter()
  final DateTime? date;
  @override
  @JsonKey()
  final bool? isApproval;
  @override
  @JsonKey()
  final bool? hasSubstituteHoliday;
  @override
  @JsonKey()
  final double absentOrLeft;
  final Map<String, double> _holidays;
  @override
  @JsonKey()
  Map<String, double> get holidays {
    if (_holidays is EqualUnmodifiableMapView) return _holidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_holidays);
  }

  final Map<String, DailyReportProject> _dailyReportProjects;
  @override
  @JsonKey()
  Map<String, DailyReportProject> get dailyReportProjects {
    if (_dailyReportProjects is EqualUnmodifiableMapView)
      return _dailyReportProjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dailyReportProjects);
  }

  @override
  @TimeStampConverter()
  final DateTime? createdAt;
  @override
  @TimeStampConverter()
  final DateTime? updatedAt;

  /// Create a copy of DailyReports
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyReportsCopyWith<_DailyReports> get copyWith =>
      __$DailyReportsCopyWithImpl<_DailyReports>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyReportsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyReports &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isApproval, isApproval) ||
                other.isApproval == isApproval) &&
            (identical(other.hasSubstituteHoliday, hasSubstituteHoliday) ||
                other.hasSubstituteHoliday == hasSubstituteHoliday) &&
            (identical(other.absentOrLeft, absentOrLeft) ||
                other.absentOrLeft == absentOrLeft) &&
            const DeepCollectionEquality().equals(other._holidays, _holidays) &&
            const DeepCollectionEquality()
                .equals(other._dailyReportProjects, _dailyReportProjects) &&
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
      date,
      isApproval,
      hasSubstituteHoliday,
      absentOrLeft,
      const DeepCollectionEquality().hash(_holidays),
      const DeepCollectionEquality().hash(_dailyReportProjects),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'DailyReports(docId: $docId, date: $date, isApproval: $isApproval, hasSubstituteHoliday: $hasSubstituteHoliday, absentOrLeft: $absentOrLeft, holidays: $holidays, dailyReportProjects: $dailyReportProjects, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DailyReportsCopyWith<$Res>
    implements $DailyReportsCopyWith<$Res> {
  factory _$DailyReportsCopyWith(
          _DailyReports value, $Res Function(_DailyReports) _then) =
      __$DailyReportsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String docId,
      @TimeStampConverter() DateTime? date,
      bool? isApproval,
      bool? hasSubstituteHoliday,
      double absentOrLeft,
      Map<String, double> holidays,
      Map<String, DailyReportProject> dailyReportProjects,
      @TimeStampConverter() DateTime? createdAt,
      @TimeStampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$DailyReportsCopyWithImpl<$Res>
    implements _$DailyReportsCopyWith<$Res> {
  __$DailyReportsCopyWithImpl(this._self, this._then);

  final _DailyReports _self;
  final $Res Function(_DailyReports) _then;

  /// Create a copy of DailyReports
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? docId = null,
    Object? date = freezed,
    Object? isApproval = freezed,
    Object? hasSubstituteHoliday = freezed,
    Object? absentOrLeft = null,
    Object? holidays = null,
    Object? dailyReportProjects = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_DailyReports(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isApproval: freezed == isApproval
          ? _self.isApproval
          : isApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSubstituteHoliday: freezed == hasSubstituteHoliday
          ? _self.hasSubstituteHoliday
          : hasSubstituteHoliday // ignore: cast_nullable_to_non_nullable
              as bool?,
      absentOrLeft: null == absentOrLeft
          ? _self.absentOrLeft
          : absentOrLeft // ignore: cast_nullable_to_non_nullable
              as double,
      holidays: null == holidays
          ? _self._holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      dailyReportProjects: null == dailyReportProjects
          ? _self._dailyReportProjects
          : dailyReportProjects // ignore: cast_nullable_to_non_nullable
              as Map<String, DailyReportProject>,
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
