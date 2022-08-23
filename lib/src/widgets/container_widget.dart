import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/interfaces/widget.dart';
import 'package:flutter_driven_ui/src/models/json.dart';
import 'package:hexcolor/hexcolor.dart';

class ContainerWidget extends ServerDrivenUIWidget {
  const ContainerWidget({Key? key, required JsonWidget widget})
      : super(key: key, widget: widget);

  @override
  Widget builder(BuildContext context, JsonWidget widget) {
    return Container(
      width: widget.data['width']?.toDouble(),
      height: widget.data['height']?.toDouble(),
      color:
          widget.data['color'] != null ? HexColor(widget.data['color']) : null,
    );
  }
}
