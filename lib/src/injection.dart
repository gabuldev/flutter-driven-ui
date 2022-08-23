import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/models/json.dart';

class ActionController extends ChangeNotifier {
  JSON? _action;

  void listen(ValueChanged<JSON> action) {
    addListener(() {
      if (_action != null) {
        action(_action!);
      }
    });
  }

  void send(JSON? action) {
    _action = action;
    notifyListeners();
  }
}

class Injection extends InheritedWidget {
  final ActionController actionController;
  const Injection({
    Key? key,
    required Widget child,
    required this.actionController,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Injection of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Injection>()!;

  static void send(BuildContext context, JSON? action) {
    if (action != null) {
      of(context).actionController.send(action);
    }
  }
}

extension BuildContextExt on BuildContext {
  void send(JSON action) => Injection.send(this, action);
}
