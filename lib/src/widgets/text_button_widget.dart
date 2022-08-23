import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/injection.dart';
import 'package:flutter_driven_ui/src/interfaces/widget.dart';
import 'package:flutter_driven_ui/src/mapper.dart';
import 'package:flutter_driven_ui/src/models/json.dart';
import 'package:hexcolor/hexcolor.dart';

class TextButtonWidget extends ServerDrivenUIWidget {
  const TextButtonWidget({Key? key, required JsonWidget widget})
      : super(key: key, widget: widget);

  @override
  Widget builder(BuildContext context, JsonWidget widget) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: widget.data['height']?.toDouble(),
        width: widget.data['expanded'] == true ? double.maxFinite : null,
        child: TextButton(
          onPressed: () {
            Injection.send(context, widget.data['action']);
          },
          child: parse(widget.data['label']),
          style: ButtonStyle(
              backgroundColor: widget.data['color'] != null
                  ? MaterialStateProperty.all(HexColor(widget.data['color']))
                  : null),
        ),
      ),
    );
  }
}
