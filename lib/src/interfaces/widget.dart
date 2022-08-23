import 'package:flutter/widgets.dart';
import 'package:flutter_driven_ui/src/models/json.dart';

abstract class ServerDrivenUIWidget extends StatelessWidget {
  final JsonWidget widget;
  const ServerDrivenUIWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  Widget builder(BuildContext context, JsonWidget widget);

  @override
  Widget build(BuildContext context) {
    try {
      return Padding(
        padding: widget.padding,
        child: builder(context, widget),
      );
    } catch (e) {
      return const SizedBox();
    }
  }
}
