import 'package:flutter/material.dart';
import 'package:japp/ui/widgets/task_details.dart';
import 'constants/ui_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: UIConstant.kPurple,
      ),
      home: const TaskDetailsScreen(),
    );
  }
}
