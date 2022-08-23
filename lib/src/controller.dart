import 'package:flutter/material.dart';
import 'package:flutter_driven_ui/src/mapper.dart';

enum DrivenUIStatus { loading, error, success, empty }

class FlutterDrivenUIController extends ChangeNotifier {
  DrivenUIStatus _status = DrivenUIStatus.empty;
  DrivenUIStatus get status => _status;
  set status(DrivenUIStatus status) {
    _status = status;
    notifyListeners();
  }

  List<Widget> body = [];
  PreferredSize? appBar;

  void render(Map<String, dynamic> json) {
    status = DrivenUIStatus.loading;
    try {
      body = [];
      final _widgets = json['body'] as List<dynamic>?;
      final _appBar = json['appbar'];

      if (_widgets != null) {
        for (var i = 0; i < _widgets.length; i++) {
          body.add(parse(_widgets[i]));
        }
      }
      if (_appBar != null) {
        appBar = PreferredSize(
            child: parse(_appBar), preferredSize: const Size.fromHeight(66));
      }
      status = DrivenUIStatus.success;
    } catch (e) {
      status = DrivenUIStatus.error;
    }
  }
}
