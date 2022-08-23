import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/flutter_driven_ui.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Driven UI - Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? screenName;
  void getScreenName() {
    FirebaseFirestore.instance
        .collection("configs")
        .doc("screen")
        .snapshots()
        .listen((event) {
      screenName = event.data()!['name'];
      setState(() {});
    });
  }

  @override
  void initState() {
    getScreenName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return screenName != null
        ? DrivenUIExample(
            screenName: screenName,
          )
        : const SizedBox();
  }
}

class DrivenUIExample extends StatefulWidget {
  final String? screenName;
  const DrivenUIExample({
    Key? key,
    this.screenName,
  }) : super(key: key);

  @override
  State<DrivenUIExample> createState() => _DrivenUIExampleState();
}

class _DrivenUIExampleState extends State<DrivenUIExample> {
  final drivenController = FlutterDrivenUIController();
  late String? screenName = widget.screenName;

  void mountScreenByName() {
    FirebaseFirestore.instance
        .collection("screens")
        .doc(screenName)
        .snapshots()
        .listen((event) {
      drivenController.render(event.data()!);
    });
  }

  @override
  void initState() {
    mountScreenByName();
    super.initState();
  }

  void buildExample() {
    drivenController.render({
      "appbar": {
        "name": "appbar",
        "data": {
          "title": {
            "name": "text",
            "data": {
              "value": "Flutter Driven UI",
            }
          }
        }
      },
      "body": [
        {
          "name": "text",
          "data": {"value": "Fala Devs!"}
        },
        {
          "name": "loading",
        },
        {
          "name": "input",
          "padding": {"left": 32.0, "right": 32.0},
          "data": {
            "label": {
              "name": "text",
              "data": {
                "value": "Flutter Driven UI",
              }
            }
          }
        },
        {
          "name": "text-button",
          "data": {
            "label": {
              "name": "text",
              "data": {"value": "Fala Devs!"}
            },
            "action": {"type": "navigate", "url": "/cadastrar"}
          }
        },
        {
          "name": "elevated-button",
          "data": {
            "label": {
              "name": "text",
              "data": {"value": "Fala Devs!"}
            },
            "action": {"type": "navigate", "url": "/cadastrar"}
          }
        }
      ]
    });
  }

  void listenAction(Map<String, dynamic> action) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterDrivenUIBuilder(
        controller: drivenController,
        listenActions: (value) {
          if (value['type'] == "navigation") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DrivenUIExample(
                          screenName: value['screen'],
                        )));
          }
        },
      ),
    );
  }
}
