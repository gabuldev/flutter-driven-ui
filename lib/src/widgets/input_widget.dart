import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/injection.dart';
import 'package:flutter_driven_ui/src/interfaces/widget.dart';
import 'package:flutter_driven_ui/src/mapper.dart';
import 'package:flutter_driven_ui/src/models/json.dart';

class InputWidget extends ServerDrivenUIWidget {
  const InputWidget({Key? key, required JsonWidget widget})
      : super(key: key, widget: widget);

  @override
  Widget builder(BuildContext context, JsonWidget widget) {
    return TextFormField(
      decoration: InputDecoration(label: parse(widget.data['label'])),
      onChanged: (value) {
        Injection.send(context, {"type": "input", "value": value});
      },
    );
  }
}
