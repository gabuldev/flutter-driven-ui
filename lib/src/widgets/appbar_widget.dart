import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/interfaces/widget.dart';
import 'package:flutter_driven_ui/src/mapper.dart';
import 'package:flutter_driven_ui/src/models/json.dart';

class AppBarWidget extends ServerDrivenUIWidget {
  const AppBarWidget({Key? key, required JsonWidget widget})
      : super(key: key, widget: widget);

  @override
  Widget builder(BuildContext context, JsonWidget widget) {
    return AppBar(
      title: parse(widget.data['title']),
    );
  }
}
