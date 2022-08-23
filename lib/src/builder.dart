import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/controller.dart';
import 'package:flutter_driven_ui/src/injection.dart';

class FlutterDrivenUIBuilder extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>>? listenActions;
  final FlutterDrivenUIController controller;

  const FlutterDrivenUIBuilder({
    Key? key,
    this.listenActions,
    required this.controller,
  }) : super(key: key);

  @override
  State<FlutterDrivenUIBuilder> createState() => _FlutterDrivenUIBuilderState();
}

class _FlutterDrivenUIBuilderState extends State<FlutterDrivenUIBuilder> {
  final actionController = ActionController();

  @override
  void initState() {
    actionController.listen((value) {
      widget.listenActions?.call(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Injection(
      actionController: actionController,
      child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, _) {
            if (widget.controller.status == DrivenUIStatus.success) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: widget.controller.appBar,
                  body: SingleChildScrollView(
                    child: Column(children: widget.controller.body),
                  ));
            } else if (widget.controller.status == DrivenUIStatus.error) {
              return const Scaffold(
                body: Center(
                  child: Text("OPS! Tivemos um error!"),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
