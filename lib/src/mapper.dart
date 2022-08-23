import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/models/json.dart';
import 'package:flutter_driven_ui/src/widgets/appbar_widget.dart';
import 'package:flutter_driven_ui/src/widgets/container_widget.dart';
import 'package:flutter_driven_ui/src/widgets/elevated_button_widget.dart';
import 'package:flutter_driven_ui/src/widgets/input_widget.dart';
import 'package:flutter_driven_ui/src/widgets/loading_widget.dart';
import 'package:flutter_driven_ui/src/widgets/text_button_widget.dart';
import 'package:flutter_driven_ui/src/widgets/text_widget.dart';

Builder parse(JSON json) {
  final widget = JsonWidget.fromMap(json);
  switch (widget.name) {
    case "container":
      {
        return Builder(builder: (context) => ContainerWidget(widget: widget));
      }
    case "text":
      {
        return Builder(builder: (context) => TextWidget(widget: widget));
      }
    case "text-button":
      {
        return Builder(builder: (context) => TextButtonWidget(widget: widget));
      }
    case "elevated-button":
      {
        return Builder(
            builder: (context) => ElevatedButtonWidget(widget: widget));
      }
    case "loading":
      {
        return Builder(builder: (context) => LoadingWidget(widget: widget));
      }
    case "input":
      {
        return Builder(builder: (context) => InputWidget(widget: widget));
      }
    case "appbar":
      {
        return Builder(builder: (context) => AppBarWidget(widget: widget));
      }

    default:
      {
        return Builder(builder: (context) => const SizedBox());
      }
  }
}
