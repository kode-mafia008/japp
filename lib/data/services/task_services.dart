import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskServiceProvider = Provider<TaskService>((ref) {
  return TaskService(ref.read);
});

class TaskService with ChangeNotifier {
  final Reader _read;

  TaskService(this._read);
}
