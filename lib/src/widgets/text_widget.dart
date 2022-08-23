import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/interfaces/widget.dart';
import 'package:flutter_driven_ui/src/models/json.dart';
import 'package:hexcolor/hexcolor.dart';

class TextWidget extends ServerDrivenUIWidget {
  const TextWidget({Key? key, required JsonWidget widget})
      : super(key: key, widget: widget);

  @override
  Widget builder(BuildContext context, JsonWidget widget) {
    return Text(
      widget.data['value'],
      style: TextStyle(
          color: widget.data['color'] != null
              ? HexColor(widget.data['color'])
              : null,
          fontSize: widget.data['size']?.toDouble()),
    );
  }
}
