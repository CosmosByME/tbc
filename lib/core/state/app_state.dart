/// InheritedWidget that provides [AppNotifier] to the widget tree.
/// Use [AppState.of(context)] anywhere in the tree to get/set settings.
import 'package:flutter/material.dart';
import '../notifiers/app_notifier.dart';

class AppState extends InheritedWidget {
  const AppState({super.key, required this.notifier, required super.child});

  final AppNotifier notifier;

  static AppNotifier of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppState>()!.notifier;

  @override
  bool updateShouldNotify(AppState old) => notifier != old.notifier;
}
