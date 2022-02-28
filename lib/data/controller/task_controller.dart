import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskControllerProvider = Provider<TaskController>((ref) {
  return TaskController(ref.read);
});

class TaskController with ChangeNotifier {
  final Reader _read;

  TaskController(this._read);

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();
  String taskNameValue = '';
  String taskDescValue = '';
  final taskFormKey = GlobalKey<FormState>();

  Future<void> addTask() async {
    if (taskFormKey.currentState!.validate()) {
      taskFormKey.currentState!.save();
    }
  }
}
