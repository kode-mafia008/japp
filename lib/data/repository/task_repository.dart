import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepository(ref.read);
});

class TaskRepository with ChangeNotifier {
  final Reader _read;

  TaskRepository(this._read);
}
