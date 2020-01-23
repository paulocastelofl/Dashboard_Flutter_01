// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$isBoolMenuAtom = Atom(name: '_HomeStoreBase.isBoolMenu');

  @override
  bool get isBoolMenu {
    _$isBoolMenuAtom.context.enforceReadPolicy(_$isBoolMenuAtom);
    _$isBoolMenuAtom.reportObserved();
    return super.isBoolMenu;
  }

  @override
  set isBoolMenu(bool value) {
    _$isBoolMenuAtom.context.conditionallyRunInAction(() {
      super.isBoolMenu = value;
      _$isBoolMenuAtom.reportChanged();
    }, _$isBoolMenuAtom, name: '${_$isBoolMenuAtom.name}_set');
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic dropdownMenu() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.dropdownMenu();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
