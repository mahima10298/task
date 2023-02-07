import 'package:flutter/material.dart';

class AddTaskController extends ChangeNotifier {
  TextEditingController placeController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController notificationController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController selectTypeController = TextEditingController();
  FocusNode selectTypeFocusNode = FocusNode();
  FocusNode placeFocusNode = FocusNode();
  FocusNode taskFocusNode = FocusNode();
  FocusNode notificationFocusNode = FocusNode();

  TimeOfDay? _selectedTime;

  TimeOfDay? get selectedTime => _selectedTime;

  String? _selectedType;

  String? get selectedType => _selectedType;

  void setTime(String time) {
    timeController.text = time;
    notifyListeners();
    print(_selectedTime);
  }


  void setType(String type) {
    selectTypeController.text = type;
    notifyListeners();
    print(_selectedType);
  }
}
