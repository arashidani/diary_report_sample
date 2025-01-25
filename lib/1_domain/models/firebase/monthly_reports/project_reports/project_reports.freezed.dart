// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectReports _$ProjectReportsFromJson(Map<String, dynamic> json) {
  return _ProjectReports.fromJson(json);
}

/// @nodoc
mixin _$ProjectReports {
//@Default('') String docId,
  String get projectId => throw _privateConstructorUsedError;
  double get business => throw _privateConstructorUsedError;
  double get late => throw _privateConstructorUsedError;
  double get over => throw _privateConstructorUsedError;

  /// Serializes this ProjectReports to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectReports
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectReportsCopyWith<ProjectReports> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectReportsCopyWith<$Res> {
  factory $ProjectReportsCopyWith(
          ProjectReports value, $Res Function(ProjectReports) then) =
      _$ProjectReportsCopyWithImpl<$Res, ProjectReports>;
  @useResult
  $Res call({String projectId, double business, double late, double over});
}

/// @nodoc
class _$ProjectReportsCopyWithImpl<$Res, $Val extends ProjectReports>
    implements $ProjectReportsCopyWith<$Res> {
  _$ProjectReportsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectReports
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? business = null,
    Object? late = null,
    Object? over = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      over: null == over
          ? _value.over
          : over // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectReportsImplCopyWith<$Res>
    implements $ProjectReportsCopyWith<$Res> {
  factory _$$ProjectReportsImplCopyWith(_$ProjectReportsImpl value,
          $Res Function(_$ProjectReportsImpl) then) =
      __$$ProjectReportsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectId, double business, double late, double over});
}

/// @nodoc
class __$$ProjectReportsImplCopyWithImpl<$Res>
    extends _$ProjectReportsCopyWithImpl<$Res, _$ProjectReportsImpl>
    implements _$$ProjectReportsImplCopyWith<$Res> {
  __$$ProjectReportsImplCopyWithImpl(
      _$ProjectReportsImpl _value, $Res Function(_$ProjectReportsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectReports
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? business = null,
    Object? late = null,
    Object? over = null,
  }) {
    return _then(_$ProjectReportsImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      over: null == over
          ? _value.over
          : over // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectReportsImpl implements _ProjectReports {
  const _$ProjectReportsImpl(
      {this.projectId = '',
      this.business = 0.0,
      this.late = 0.0,
      this.over = 0.0});

  factory _$ProjectReportsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectReportsImplFromJson(json);

//@Default('') String docId,
  @override
  @JsonKey()
  final String projectId;
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
  String toString() {
    return 'ProjectReports(projectId: $projectId, business: $business, late: $late, over: $over)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectReportsImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.over, over) || other.over == over));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, business, late, over);

  /// Create a copy of ProjectReports
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectReportsImplCopyWith<_$ProjectReportsImpl> get copyWith =>
      __$$ProjectReportsImplCopyWithImpl<_$ProjectReportsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectReportsImplToJson(
      this,
    );
  }
}

abstract class _ProjectReports implements ProjectReports {
  const factory _ProjectReports(
      {final String projectId,
      final double business,
      final double late,
      final double over}) = _$ProjectReportsImpl;

  factory _ProjectReports.fromJson(Map<String, dynamic> json) =
      _$ProjectReportsImpl.fromJson;

//@Default('') String docId,
  @override
  String get projectId;
  @override
  double get business;
  @override
  double get late;
  @override
  double get over;

  /// Create a copy of ProjectReports
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectReportsImplCopyWith<_$ProjectReportsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
