import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japp/data/controller/task_controller.dart';
import 'package:japp/helpers/validators.dart';
import 'package:japp/ui/widgets/input_field.dart';

import '../../constants/ui_constants.dart';

class CreateTodoScreen extends ConsumerStatefulWidget {
  const CreateTodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends ConsumerState<CreateTodoScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.read(taskControllerProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              // Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Create Task',
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InputField(
                isDescField: true,
                validator: (value) => Validators.taskNameValidator(value),
                hintText: 'What do you want to do?',
                controller: data.taskNameController,
                onSaved: (value) => data.taskNameValue = value!,
              ),
              const SizedBox(
                height: 8,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description ',
                  style: TextStyle(
                    fontSize: 14,
                    color: UIConstant.kFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InputField(
                isDescField: false,
                validator: (value) => Validators.taskNameValidator(value),
                hintText: 'Describe your task',
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
