// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardEvent {
  DashboardTab get tab => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DashboardTab tab) changeTabRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DashboardTab tab)? changeTabRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DashboardTab tab)? changeTabRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTabRequested value) changeTabRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTabRequested value)? changeTabRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTabRequested value)? changeTabRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardEventCopyWith<DashboardEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
  @useResult
  $Res call({DashboardTab tab});
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_value.copyWith(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as DashboardTab,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeTabRequestedCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$$_ChangeTabRequestedCopyWith(_$_ChangeTabRequested value,
          $Res Function(_$_ChangeTabRequested) then) =
      __$$_ChangeTabRequestedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardTab tab});
}

/// @nodoc
class __$$_ChangeTabRequestedCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$_ChangeTabRequested>
    implements _$$_ChangeTabRequestedCopyWith<$Res> {
  __$$_ChangeTabRequestedCopyWithImpl(
      _$_ChangeTabRequested _value, $Res Function(_$_ChangeTabRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_$_ChangeTabRequested(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as DashboardTab,
    ));
  }
}

/// @nodoc

class _$_ChangeTabRequested implements _ChangeTabRequested {
  const _$_ChangeTabRequested({required this.tab});

  @override
  final DashboardTab tab;

  @override
  String toString() {
    return 'DashboardEvent.changeTabRequested(tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTabRequested &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTabRequestedCopyWith<_$_ChangeTabRequested> get copyWith =>
      __$$_ChangeTabRequestedCopyWithImpl<_$_ChangeTabRequested>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DashboardTab tab) changeTabRequested,
  }) {
    return changeTabRequested(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DashboardTab tab)? changeTabRequested,
  }) {
    return changeTabRequested?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DashboardTab tab)? changeTabRequested,
    required TResult orElse(),
  }) {
    if (changeTabRequested != null) {
      return changeTabRequested(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTabRequested value) changeTabRequested,
  }) {
    return changeTabRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTabRequested value)? changeTabRequested,
  }) {
    return changeTabRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTabRequested value)? changeTabRequested,
    required TResult orElse(),
  }) {
    if (changeTabRequested != null) {
      return changeTabRequested(this);
    }
    return orElse();
  }
}

abstract class _ChangeTabRequested implements DashboardEvent {
  const factory _ChangeTabRequested({required final DashboardTab tab}) =
      _$_ChangeTabRequested;

  @override
  DashboardTab get tab;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeTabRequestedCopyWith<_$_ChangeTabRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DashboardState {
  DashboardTab get tab => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DashboardTab tab) initial,
    required TResult Function(DashboardTab tab) popTabToRoot,
    required TResult Function(DashboardTab tab) tabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DashboardTab tab)? initial,
    TResult? Function(DashboardTab tab)? popTabToRoot,
    TResult? Function(DashboardTab tab)? tabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DashboardTab tab)? initial,
    TResult Function(DashboardTab tab)? popTabToRoot,
    TResult Function(DashboardTab tab)? tabChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PopTabToRoot value) popTabToRoot,
    required TResult Function(_TabChanged value) tabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PopTabToRoot value)? popTabToRoot,
    TResult? Function(_TabChanged value)? tabChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PopTabToRoot value)? popTabToRoot,
    TResult Function(_TabChanged value)? tabChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call({DashboardTab tab});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_value.copyWith(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as DashboardTab,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardTab tab});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_$_Initial(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as DashboardTab,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.tab = DashboardTab.home});

  @override
  @JsonKey()
  final DashboardTab tab;

  @override
  String toString() {
    return 'DashboardState.initial(tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DashboardTab tab) initial,
    required TResult Function(DashboardTab tab) popTabToRoot,
    required TResult Function(DashboardTab tab) tabChanged,
  }) {
    return initial(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DashboardTab tab)? initial,
    TResult? Function(DashboardTab tab)? popTabToRoot,
    TResult? Function(DashboardTab tab)? tabChanged,
  }) {
    return initial?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DashboardTab tab)? initial,
    TResult Function(DashboardTab tab)? popTabToRoot,
    TResult Function(DashboardTab tab)? tabChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PopTabToRoot value) popTabToRoot,
    required TResult Function(_TabChanged value) tabChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PopTabToRoot value)? popTabToRoot,
    TResult? Function(_TabChanged value)? tabChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PopTabToRoot value)? popTabToRoot,
    TResult Function(_TabChanged value)? tabChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DashboardState {
  const factory _Initial({final DashboardTab tab}) = _$_Initial;

  @override
  DashboardTab get tab;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PopTabToRootCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$_PopTabToRootCopyWith(
          _$_PopTabToRoot value, $Res Function(_$_PopTabToRoot) then) =
      __$$_PopTabToRootCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardTab tab});
}

/// @nodoc
class __$$_PopTabToRootCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$_PopTabToRoot>
    implements _$$_PopTabToRootCopyWith<$Res> {
  __$$_PopTabToRootCopyWithImpl(
      _$_PopTabToRoot _value, $Res Function(_$_PopTabToRoot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_$_PopTabToRoot(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as DashboardTab,
    ));
  }
}

/// @nodoc

class _$_PopTabToRoot implements _PopTabToRoot {
  const _$_PopTabToRoot({required this.tab});

  @override
  final DashboardTab tab;

  @override
  String toString() {
    return 'DashboardState.popTabToRoot(tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PopTabToRoot &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PopTabToRootCopyWith<_$_PopTabToRoot> get copyWith =>
      __$$_PopTabToRootCopyWithImpl<_$_PopTabToRoot>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DashboardTab tab) initial,
    required TResult Function(DashboardTab tab) popTabToRoot,
    required TResult Function(DashboardTab tab) tabChanged,
  }) {
    return popTabToRoot(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DashboardTab tab)? initial,
    TResult? Function(DashboardTab tab)? popTabToRoot,
    TResult? Function(DashboardTab tab)? tabChanged,
  }) {
    return popTabToRoot?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DashboardTab tab)? initial,
    TResult Function(DashboardTab tab)? popTabToRoot,
    TResult Function(DashboardTab tab)? tabChanged,
    required TResult orElse(),
  }) {
    if (popTabToRoot != null) {
      return popTabToRoot(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PopTabToRoot value) popTabToRoot,
    required TResult Function(_TabChanged value) tabChanged,
  }) {
    return popTabToRoot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PopTabToRoot value)? popTabToRoot,
    TResult? Function(_TabChanged value)? tabChanged,
  }) {
    return popTabToRoot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PopTabToRoot value)? popTabToRoot,
    TResult Function(_TabChanged value)? tabChanged,
    required TResult orElse(),
  }) {
    if (popTabToRoot != null) {
      return popTabToRoot(this);
    }
    return orElse();
  }
}

abstract class _PopTabToRoot implements DashboardState {
  const factory _PopTabToRoot({required final DashboardTab tab}) =
      _$_PopTabToRoot;

  @override
  DashboardTab get tab;
  @override
  @JsonKey(ignore: true)
  _$$_PopTabToRootCopyWith<_$_PopTabToRoot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TabChangedCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$_TabChangedCopyWith(
          _$_TabChanged value, $Res Function(_$_TabChanged) then) =
      __$$_TabChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardTab tab});
}

/// @nodoc
class __$$_TabChangedCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$_TabChanged>
    implements _$$_TabChangedCopyWith<$Res> {
  __$$_TabChangedCopyWithImpl(
      _$_TabChanged _value, $Res Function(_$_TabChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_$_TabChanged(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as DashboardTab,
    ));
  }
}

/// @nodoc

class _$_TabChanged implements _TabChanged {
  const _$_TabChanged({required this.tab});

  @override
  final DashboardTab tab;

  @override
  String toString() {
    return 'DashboardState.tabChanged(tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabChanged &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabChangedCopyWith<_$_TabChanged> get copyWith =>
      __$$_TabChangedCopyWithImpl<_$_TabChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DashboardTab tab) initial,
    required TResult Function(DashboardTab tab) popTabToRoot,
    required TResult Function(DashboardTab tab) tabChanged,
  }) {
    return tabChanged(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DashboardTab tab)? initial,
    TResult? Function(DashboardTab tab)? popTabToRoot,
    TResult? Function(DashboardTab tab)? tabChanged,
  }) {
    return tabChanged?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DashboardTab tab)? initial,
    TResult Function(DashboardTab tab)? popTabToRoot,
    TResult Function(DashboardTab tab)? tabChanged,
    required TResult orElse(),
  }) {
    if (tabChanged != null) {
      return tabChanged(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PopTabToRoot value) popTabToRoot,
    required TResult Function(_TabChanged value) tabChanged,
  }) {
    return tabChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PopTabToRoot value)? popTabToRoot,
    TResult? Function(_TabChanged value)? tabChanged,
  }) {
    return tabChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PopTabToRoot value)? popTabToRoot,
    TResult Function(_TabChanged value)? tabChanged,
    required TResult orElse(),
  }) {
    if (tabChanged != null) {
      return tabChanged(this);
    }
    return orElse();
  }
}

abstract class _TabChanged implements DashboardState {
  const factory _TabChanged({required final DashboardTab tab}) = _$_TabChanged;

  @override
  DashboardTab get tab;
  @override
  @JsonKey(ignore: true)
  _$$_TabChangedCopyWith<_$_TabChanged> get copyWith =>
      throw _privateConstructorUsedError;
}
