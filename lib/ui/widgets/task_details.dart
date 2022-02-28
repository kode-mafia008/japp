import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japp/data/controller/task_controller.dart';
import 'package:japp/helpers/validators.dart';
import 'package:japp/ui/widgets/input_field.dart';

import '../../constants/ui_constants.dart';

class TaskDetailsScreen extends ConsumerStatefulWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends ConsumerState<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.read(taskControllerProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 28,
                )),
            const SizedBox(
              width: 4,
            )
          ],
          leading: InkWell(
            onTap: () {
              // Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Task Details',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          backgroundColor: UIConstant.kPurple,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Title ',
                  style: TextStyle(
                    fontSize: 14,
                    color: UIConstant.kFont,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InputField(
                isDescField: true,
                isEdit: true,
                validator: (value) => Validators.taskNameValidator(value),
                hintText: 'Meeting with John',
                controller: data.taskNameController,
                onSaved: (value) => data.taskNameValue = value!,
              ),
              const SizedBox(
                height: 12,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description ',
                  style: TextStyle(
                    fontSize: 14,
                    color: UIConstant.kFont,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InputField(
                isDescField: false,
                isEdit: true,
                validator: (value) => Validators.taskNameValidator(value),
                hintText: 'This is description',
                controller: data.taskDescController,
                onSaved: (value) => data.taskDescValue = value!,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ));
  }
}
