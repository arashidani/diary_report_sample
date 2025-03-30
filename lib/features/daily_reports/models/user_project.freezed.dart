// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProject {
  String get docId;
  @TimeStampConverter()
  DateTime? get addedAt;

  /// Create a copy of UserProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProjectCopyWith<UserProject> get copyWith =>
      _$UserProjectCopyWithImpl<UserProject>(this as UserProject, _$identity);

  /// Serializes this UserProject to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProject &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, docId, addedAt);

  @override
  String toString() {
    return 'UserProject(docId: $docId, addedAt: $addedAt)';
  }
}

/// @nodoc
abstract mixin class $UserProjectCopyWith<$Res> {
  factory $UserProjectCopyWith(
          UserProject value, $Res Function(UserProject) _then) =
      _$UserProjectCopyWithImpl;
  @useResult
  $Res call({String docId, @TimeStampConverter() DateTime? addedAt});
}

/// @nodoc
class _$UserProjectCopyWithImpl<$Res> implements $UserProjectCopyWith<$Res> {
  _$UserProjectCopyWithImpl(this._self, this._then);

  final UserProject _self;
  final $Res Function(UserProject) _then;

  /// Create a copy of UserProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? addedAt = freezed,
  }) {
    return _then(_self.copyWith(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: freezed == addedAt
          ? _self.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserProject implements UserProject {
  const _UserProject({this.docId = '', @TimeStampConverter() this.addedAt});
  factory _UserProject.fromJson(Map<String, dynamic> json) =>
      _$UserProjectFromJson(json);

  @override
  @JsonKey()
  final String docId;
  @override
  @TimeStampConverter()
  final DateTime? addedAt;

  /// Create a copy of UserProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProjectCopyWith<_UserProject> get copyWith =>
      __$UserProjectCopyWithImpl<_UserProject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProjectToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProject &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, docId, addedAt);

  @override
  String toString() {
    return 'UserProject(docId: $docId, addedAt: $addedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserProjectCopyWith<$Res>
    implements $UserProjectCopyWith<$Res> {
  factory _$UserProjectCopyWith(
          _UserProject value, $Res Function(_UserProject) _then) =
      __$UserProjectCopyWithImpl;
  @override
  @useResult
  $Res call({String docId, @TimeStampConverter() DateTime? addedAt});
}

/// @nodoc
class __$UserProjectCopyWithImpl<$Res> implements _$UserProjectCopyWith<$Res> {
  __$UserProjectCopyWithImpl(this._self, this._then);

  final _UserProject _self;
  final $Res Function(_UserProject) _then;

  /// Create a copy of UserProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? docId = null,
    Object? addedAt = freezed,
  }) {
    return _then(_UserProject(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: freezed == addedAt
          ? _self.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
