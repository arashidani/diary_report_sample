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
  double get business;
  double get late;
  double get over;

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
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.over, over) || other.over == over));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, business, late, over);

  @override
  String toString() {
    return 'DailyReportProject(business: $business, late: $late, over: $over)';
  }
}

/// @nodoc
abstract mixin class $DailyReportProjectCopyWith<$Res> {
  factory $DailyReportProjectCopyWith(
          DailyReportProject value, $Res Function(DailyReportProject) _then) =
      _$DailyReportProjectCopyWithImpl;
  @useResult
  $Res call({double business, double late, double over});
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
    Object? business = null,
    Object? late = null,
    Object? over = null,
  }) {
    return _then(_self.copyWith(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DailyReportProject implements DailyReportProject {
  const _DailyReportProject(
      {this.business = 0.0, this.late = 0.0, this.over = 0.0});
  factory _DailyReportProject.fromJson(Map<String, dynamic> json) =>
      _$DailyReportProjectFromJson(json);

  @override
  @JsonKey()
  final double business;
  @override
  @JsonKey()
  final double late;
  @override
  @JsonKey()
  final double over;

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
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.over, over) || other.over == over));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, business, late, over);

  @override
  String toString() {
    return 'DailyReportProject(business: $business, late: $late, over: $over)';
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
  $Res call({double business, double late, double over});
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
    Object? business = null,
    Object? late = null,
    Object? over = null,
  }) {
    return _then(_DailyReportProject(
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
    ));
  }
}

// dart format on
