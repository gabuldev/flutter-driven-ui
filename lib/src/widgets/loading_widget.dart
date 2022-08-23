import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/interfaces/widget.dart';
import 'package:flutter_driven_ui/src/models/json.dart';

class LoadingWidget extends ServerDrivenUIWidget {
  const LoadingWidget({Key? key, required JsonWidget widget})
      : super(key: key, widget: widget);

  @override
  Widget builder(BuildContext context, JsonWidget widget) {
    return const CircularProgressIndicator();
  }
}
