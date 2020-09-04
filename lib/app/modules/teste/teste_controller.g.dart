// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teste_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TesteController = BindInject(
  (i) => TesteController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TesteController1 on _TesteControllerBase, Store {
  final _$formKeyAtom = Atom(name: '_TesteControllerBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$loadingAtom = Atom(name: '_TesteControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginWithEmailPasswordAsyncAction =
      AsyncAction('_TesteControllerBase.loginWithEmailPassword');

  @override
  Future<dynamic> loginWithEmailPassword(dynamic user) {
    return _$loginWithEmailPasswordAsyncAction
        .run(() => super.loginWithEmailPassword(user));
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
loading: ${loading}
    ''';
  }
}
