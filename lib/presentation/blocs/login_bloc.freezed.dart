// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent()';
  }
}

/// @nodoc
class $LoginEventCopyWith<$Res> {
  $LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}

/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_usernameChanged value)? usernameChanged,
    TResult Function(_passwordChanged value)? passwordChanged,
    TResult Function(_Connect value)? connect,
    TResult Function(_ConnectWithFacebook value)? connectWithFacebook,
    TResult Function(_ConnectWithGoogle value)? connectWithInstagram,
    TResult Function(_ConnectWithTwitter value)? connectWithTwitter,
    TResult Function(_Connected value)? connected,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _TogglePasswordVisibility() when togglePasswordVisibility != null:
        return togglePasswordVisibility(_that);
      case _usernameChanged() when usernameChanged != null:
        return usernameChanged(_that);
      case _passwordChanged() when passwordChanged != null:
        return passwordChanged(_that);
      case _Connect() when connect != null:
        return connect(_that);
      case _ConnectWithFacebook() when connectWithFacebook != null:
        return connectWithFacebook(_that);
      case _ConnectWithGoogle() when connectWithInstagram != null:
        return connectWithInstagram(_that);
      case _ConnectWithTwitter() when connectWithTwitter != null:
        return connectWithTwitter(_that);
      case _Connected() when connected != null:
        return connected(_that);
      case _ConnectionFailed() when connectionFailed != null:
        return connectionFailed(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_usernameChanged value) usernameChanged,
    required TResult Function(_passwordChanged value) passwordChanged,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ConnectWithFacebook value) connectWithFacebook,
    required TResult Function(_ConnectWithGoogle value) connectWithInstagram,
    required TResult Function(_ConnectWithTwitter value) connectWithTwitter,
    required TResult Function(_Connected value) connected,
    required TResult Function(_ConnectionFailed value) connectionFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _TogglePasswordVisibility():
        return togglePasswordVisibility(_that);
      case _usernameChanged():
        return usernameChanged(_that);
      case _passwordChanged():
        return passwordChanged(_that);
      case _Connect():
        return connect(_that);
      case _ConnectWithFacebook():
        return connectWithFacebook(_that);
      case _ConnectWithGoogle():
        return connectWithInstagram(_that);
      case _ConnectWithTwitter():
        return connectWithTwitter(_that);
      case _Connected():
        return connected(_that);
      case _ConnectionFailed():
        return connectionFailed(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_usernameChanged value)? usernameChanged,
    TResult? Function(_passwordChanged value)? passwordChanged,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ConnectWithFacebook value)? connectWithFacebook,
    TResult? Function(_ConnectWithGoogle value)? connectWithInstagram,
    TResult? Function(_ConnectWithTwitter value)? connectWithTwitter,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _TogglePasswordVisibility() when togglePasswordVisibility != null:
        return togglePasswordVisibility(_that);
      case _usernameChanged() when usernameChanged != null:
        return usernameChanged(_that);
      case _passwordChanged() when passwordChanged != null:
        return passwordChanged(_that);
      case _Connect() when connect != null:
        return connect(_that);
      case _ConnectWithFacebook() when connectWithFacebook != null:
        return connectWithFacebook(_that);
      case _ConnectWithGoogle() when connectWithInstagram != null:
        return connectWithInstagram(_that);
      case _ConnectWithTwitter() when connectWithTwitter != null:
        return connectWithTwitter(_that);
      case _Connected() when connected != null:
        return connected(_that);
      case _ConnectionFailed() when connectionFailed != null:
        return connectionFailed(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool visibility)? togglePasswordVisibility,
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? connect,
    TResult Function()? connectWithFacebook,
    TResult Function()? connectWithInstagram,
    TResult Function()? connectWithTwitter,
    TResult Function()? connected,
    TResult Function()? connectionFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _TogglePasswordVisibility() when togglePasswordVisibility != null:
        return togglePasswordVisibility(_that.visibility);
      case _usernameChanged() when usernameChanged != null:
        return usernameChanged(_that.username);
      case _passwordChanged() when passwordChanged != null:
        return passwordChanged(_that.password);
      case _Connect() when connect != null:
        return connect();
      case _ConnectWithFacebook() when connectWithFacebook != null:
        return connectWithFacebook();
      case _ConnectWithGoogle() when connectWithInstagram != null:
        return connectWithInstagram();
      case _ConnectWithTwitter() when connectWithTwitter != null:
        return connectWithTwitter();
      case _Connected() when connected != null:
        return connected();
      case _ConnectionFailed() when connectionFailed != null:
        return connectionFailed();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool visibility) togglePasswordVisibility,
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() connect,
    required TResult Function() connectWithFacebook,
    required TResult Function() connectWithInstagram,
    required TResult Function() connectWithTwitter,
    required TResult Function() connected,
    required TResult Function() connectionFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _TogglePasswordVisibility():
        return togglePasswordVisibility(_that.visibility);
      case _usernameChanged():
        return usernameChanged(_that.username);
      case _passwordChanged():
        return passwordChanged(_that.password);
      case _Connect():
        return connect();
      case _ConnectWithFacebook():
        return connectWithFacebook();
      case _ConnectWithGoogle():
        return connectWithInstagram();
      case _ConnectWithTwitter():
        return connectWithTwitter();
      case _Connected():
        return connected();
      case _ConnectionFailed():
        return connectionFailed();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool visibility)? togglePasswordVisibility,
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? connect,
    TResult? Function()? connectWithFacebook,
    TResult? Function()? connectWithInstagram,
    TResult? Function()? connectWithTwitter,
    TResult? Function()? connected,
    TResult? Function()? connectionFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _TogglePasswordVisibility() when togglePasswordVisibility != null:
        return togglePasswordVisibility(_that.visibility);
      case _usernameChanged() when usernameChanged != null:
        return usernameChanged(_that.username);
      case _passwordChanged() when passwordChanged != null:
        return passwordChanged(_that.password);
      case _Connect() when connect != null:
        return connect();
      case _ConnectWithFacebook() when connectWithFacebook != null:
        return connectWithFacebook();
      case _ConnectWithGoogle() when connectWithInstagram != null:
        return connectWithInstagram();
      case _ConnectWithTwitter() when connectWithTwitter != null:
        return connectWithTwitter();
      case _Connected() when connected != null:
        return connected();
      case _ConnectionFailed() when connectionFailed != null:
        return connectionFailed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements LoginEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.started()';
  }
}

/// @nodoc

class _TogglePasswordVisibility implements LoginEvent {
  const _TogglePasswordVisibility(this.visibility);

  final bool visibility;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TogglePasswordVisibilityCopyWith<_TogglePasswordVisibility> get copyWith =>
      __$TogglePasswordVisibilityCopyWithImpl<_TogglePasswordVisibility>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TogglePasswordVisibility &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, visibility);

  @override
  String toString() {
    return 'LoginEvent.togglePasswordVisibility(visibility: $visibility)';
  }
}

/// @nodoc
abstract mixin class _$TogglePasswordVisibilityCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$TogglePasswordVisibilityCopyWith(_TogglePasswordVisibility value,
          $Res Function(_TogglePasswordVisibility) _then) =
      __$TogglePasswordVisibilityCopyWithImpl;
  @useResult
  $Res call({bool visibility});
}

/// @nodoc
class __$TogglePasswordVisibilityCopyWithImpl<$Res>
    implements _$TogglePasswordVisibilityCopyWith<$Res> {
  __$TogglePasswordVisibilityCopyWithImpl(this._self, this._then);

  final _TogglePasswordVisibility _self;
  final $Res Function(_TogglePasswordVisibility) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? visibility = null,
  }) {
    return _then(_TogglePasswordVisibility(
      null == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _usernameChanged implements LoginEvent {
  const _usernameChanged(this.username);

  final String username;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$usernameChangedCopyWith<_usernameChanged> get copyWith =>
      __$usernameChangedCopyWithImpl<_usernameChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _usernameChanged &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @override
  String toString() {
    return 'LoginEvent.usernameChanged(username: $username)';
  }
}

/// @nodoc
abstract mixin class _$usernameChangedCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$usernameChangedCopyWith(
          _usernameChanged value, $Res Function(_usernameChanged) _then) =
      __$usernameChangedCopyWithImpl;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$usernameChangedCopyWithImpl<$Res>
    implements _$usernameChangedCopyWith<$Res> {
  __$usernameChangedCopyWithImpl(this._self, this._then);

  final _usernameChanged _self;
  final $Res Function(_usernameChanged) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
  }) {
    return _then(_usernameChanged(
      null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _passwordChanged implements LoginEvent {
  const _passwordChanged(this.password);

  final String password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$passwordChangedCopyWith<_passwordChanged> get copyWith =>
      __$passwordChangedCopyWithImpl<_passwordChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _passwordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @override
  String toString() {
    return 'LoginEvent.passwordChanged(password: $password)';
  }
}

/// @nodoc
abstract mixin class _$passwordChangedCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$passwordChangedCopyWith(
          _passwordChanged value, $Res Function(_passwordChanged) _then) =
      __$passwordChangedCopyWithImpl;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$passwordChangedCopyWithImpl<$Res>
    implements _$passwordChangedCopyWith<$Res> {
  __$passwordChangedCopyWithImpl(this._self, this._then);

  final _passwordChanged _self;
  final $Res Function(_passwordChanged) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
  }) {
    return _then(_passwordChanged(
      null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Connect implements LoginEvent {
  const _Connect();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Connect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.connect()';
  }
}

/// @nodoc

class _ConnectWithFacebook implements LoginEvent {
  const _ConnectWithFacebook();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ConnectWithFacebook);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.connectWithFacebook()';
  }
}

/// @nodoc

class _ConnectWithGoogle implements LoginEvent {
  const _ConnectWithGoogle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ConnectWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.connectWithInstagram()';
  }
}

/// @nodoc

class _ConnectWithTwitter implements LoginEvent {
  const _ConnectWithTwitter();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ConnectWithTwitter);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.connectWithTwitter()';
  }
}

/// @nodoc

class _Connected implements LoginEvent {
  const _Connected();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Connected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.connected()';
  }
}

/// @nodoc

class _ConnectionFailed implements LoginEvent {
  const _ConnectionFailed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ConnectionFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.connectionFailed()';
  }
}

/// @nodoc
mixin _$LoginState {
  LoginStatusView get loginStatus;
  String get errorMessage;
  bool get togglePasswordVisibility;
  String get username;
  String get password;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(
                    other.togglePasswordVisibility, togglePasswordVisibility) ||
                other.togglePasswordVisibility == togglePasswordVisibility) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginStatus, errorMessage,
      togglePasswordVisibility, username, password);

  @override
  String toString() {
    return 'LoginState(loginStatus: $loginStatus, errorMessage: $errorMessage, togglePasswordVisibility: $togglePasswordVisibility, username: $username, password: $password)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {LoginStatusView loginStatus,
      String errorMessage,
      bool togglePasswordVisibility,
      String username,
      String password});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? errorMessage = null,
    Object? togglePasswordVisibility = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatusView,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      togglePasswordVisibility: null == togglePasswordVisibility
          ? _self.togglePasswordVisibility
          : togglePasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Initial value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Initial value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Initial value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(LoginStatusView loginStatus, String errorMessage,
            bool togglePasswordVisibility, String username, String password)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that.loginStatus, _that.errorMessage,
            _that.togglePasswordVisibility, _that.username, _that.password);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(LoginStatusView loginStatus, String errorMessage,
            bool togglePasswordVisibility, String username, String password)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(_that.loginStatus, _that.errorMessage,
            _that.togglePasswordVisibility, _that.username, _that.password);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(LoginStatusView loginStatus, String errorMessage,
            bool togglePasswordVisibility, String username, String password)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that.loginStatus, _that.errorMessage,
            _that.togglePasswordVisibility, _that.username, _that.password);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements LoginState {
  const _Initial(
      {required this.loginStatus,
      this.errorMessage = '',
      this.togglePasswordVisibility = true,
      this.username = '',
      this.password = ''});

  @override
  final LoginStatusView loginStatus;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool togglePasswordVisibility;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(
                    other.togglePasswordVisibility, togglePasswordVisibility) ||
                other.togglePasswordVisibility == togglePasswordVisibility) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginStatus, errorMessage,
      togglePasswordVisibility, username, password);

  @override
  String toString() {
    return 'LoginState(loginStatus: $loginStatus, errorMessage: $errorMessage, togglePasswordVisibility: $togglePasswordVisibility, username: $username, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoginStatusView loginStatus,
      String errorMessage,
      bool togglePasswordVisibility,
      String username,
      String password});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loginStatus = null,
    Object? errorMessage = null,
    Object? togglePasswordVisibility = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_Initial(
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatusView,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      togglePasswordVisibility: null == togglePasswordVisibility
          ? _self.togglePasswordVisibility
          : togglePasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
