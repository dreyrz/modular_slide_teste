// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loginWithEmailPasswordAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithEmailPassword');

  @override
  Future<dynamic> loginWithEmailPassword(dynamic user) {
    return _$loginWithEmailPasswordAsyncAction
        .run(() => super.loginWithEmailPassword(user));
  }

  final _$signUpWithEmailPasswordAsyncAction =
      AsyncAction('_AuthControllerBase.signUpWithEmailPassword');

  @override
  Future<void> signUpWithEmailPassword(
      dynamic user, Function onFail, Function onSuccess) {
    return _$signUpWithEmailPasswordAsyncAction
        .run(() => super.signUpWithEmailPassword(user, onFail, onSuccess));
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setUser(FirebaseUser value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
user: ${user}
    ''';
  }
}
