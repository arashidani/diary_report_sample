// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Users {
  String get docId;
  String get email;
  String get employeeId;
  String get firstName;
  String get lastName;
  String get fullName;
  String get divId;
  String get role;
  @TimeStampConverter()
  DateTime? get createdAt;
  @TimeStampConverter()
  DateTime? get updatedAt;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersCopyWith<Users> get copyWith =>
      _$UsersCopyWithImpl<Users>(this as Users, _$identity);

  /// Serializes this Users to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Users &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.divId, divId) || other.divId == divId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, docId, email, employeeId,
      firstName, lastName, fullName, divId, role, createdAt, updatedAt);

  @override
  String toString() {
    return 'Users(docId: $docId, email: $email, employeeId: $employeeId, firstName: $firstName, lastName: $lastName, fullName: $fullName, divId: $divId, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) _then) =
      _$UsersCopyWithImpl;
  @useResult
  $Res call(
      {String docId,
      String email,
      String employeeId,
      String firstName,
      String lastName,
      String fullName,
      String divId,
      String role,
      @TimeStampConverter() DateTime? createdAt,
      @TimeStampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res> implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._self, this._then);

  final Users _self;
  final $Res Function(Users) _then;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = null,
    Object? email = null,
    Object? employeeId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? fullName = null,
    Object? divId = null,
    Object? role = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      divId: null == divId
          ? _self.divId
          : divId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
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
class _Users implements Users {
  const _Users(
      {this.docId = '',
      this.email = '',
      this.employeeId = '',
      this.firstName = '',
      this.lastName = '',
      this.fullName = '',
      this.divId = '',
      this.role = '',
      @TimeStampConverter() this.createdAt,
      @TimeStampConverter() this.updatedAt});
  factory _Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  @override
  @JsonKey()
  final String docId;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String employeeId;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String divId;
  @override
  @JsonKey()
  final String role;
  @override
  @TimeStampConverter()
  final DateTime? createdAt;
  @override
  @TimeStampConverter()
  final DateTime? updatedAt;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsersCopyWith<_Users> get copyWith =>
      __$UsersCopyWithImpl<_Users>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsersToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Users &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.divId, divId) || other.divId == divId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, docId, email, employeeId,
      firstName, lastName, fullName, divId, role, createdAt, updatedAt);

  @override
  String toString() {
    return 'Users(docId: $docId, email: $email, employeeId: $employeeId, firstName: $firstName, lastName: $lastName, fullName: $fullName, divId: $divId, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UsersCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$UsersCopyWith(_Users value, $Res Function(_Users) _then) =
      __$UsersCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String docId,
      String email,
      String employeeId,
      String firstName,
      String lastName,
      String fullName,
      String divId,
      String role,
      @TimeStampConverter() DateTime? createdAt,
      @TimeStampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$UsersCopyWithImpl<$Res> implements _$UsersCopyWith<$Res> {
  __$UsersCopyWithImpl(this._self, this._then);

  final _Users _self;
  final $Res Function(_Users) _then;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? docId = null,
    Object? email = null,
    Object? employeeId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? fullName = null,
    Object? divId = null,
    Object? role = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Users(
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      divId: null == divId
          ? _self.divId
          : divId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
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
