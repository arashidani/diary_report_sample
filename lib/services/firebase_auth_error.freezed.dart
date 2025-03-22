// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_auth_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FirebaseAuthError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FirebaseAuthError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FirebaseAuthError()';
  }
}

/// @nodoc
class $FirebaseAuthErrorCopyWith<$Res> {
  $FirebaseAuthErrorCopyWith(
      FirebaseAuthError _, $Res Function(FirebaseAuthError) __);
}

/// @nodoc

class UserNotFound implements FirebaseAuthError {
  const UserNotFound();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FirebaseAuthError.userNotFound()';
  }
}

/// @nodoc

class WrongPassword implements FirebaseAuthError {
  const WrongPassword();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WrongPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FirebaseAuthError.wrongPassword()';
  }
}

/// @nodoc

class EmailAlreadyInUse implements FirebaseAuthError {
  const EmailAlreadyInUse();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FirebaseAuthError.emailAlreadyInUse()';
  }
}

/// @nodoc

class InvalidEmail implements FirebaseAuthError {
  const InvalidEmail();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InvalidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FirebaseAuthError.invalidEmail()';
  }
}

/// @nodoc

class WeakPassword implements FirebaseAuthError {
  const WeakPassword();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeakPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FirebaseAuthError.weakPassword()';
  }
}

/// @nodoc

class OperationNotAllowed implements FirebaseAuthError {
  const OperationNotAllowed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OperationNotAllowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FirebaseAuthError.operationNotAllowed()';
  }
}

/// @nodoc

class Unknown implements FirebaseAuthError {
  const Unknown({required this.code});

  final String code;

  /// Create a copy of FirebaseAuthError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnknownCopyWith<Unknown> get copyWith =>
      _$UnknownCopyWithImpl<Unknown>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Unknown &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @override
  String toString() {
    return 'FirebaseAuthError.unknown(code: $code)';
  }
}

/// @nodoc
abstract mixin class $UnknownCopyWith<$Res>
    implements $FirebaseAuthErrorCopyWith<$Res> {
  factory $UnknownCopyWith(Unknown value, $Res Function(Unknown) _then) =
      _$UnknownCopyWithImpl;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$UnknownCopyWithImpl<$Res> implements $UnknownCopyWith<$Res> {
  _$UnknownCopyWithImpl(this._self, this._then);

  final Unknown _self;
  final $Res Function(Unknown) _then;

  /// Create a copy of FirebaseAuthError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
  }) {
    return _then(Unknown(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
