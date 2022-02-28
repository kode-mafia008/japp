import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constants/ui_constants.dart';

class TodoListScreen extends ConsumerStatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends ConsumerState<TodoListScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        backgroundColor: UIConstant.kPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              horizontalTitleGap: 16.0,
              title: Text('Meeting with John',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: UIConstant.kFont,
                    fontSize: 14,
                  )),
              isThreeLine: true,
              subtitle:
                  Text('Secondary text Tertiary text may be due to russian',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        overflow: TextOverflow.ellipsis,
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        color: UIConstant.kGFont,
                        fontSize: 12,
                      )),
              leading: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: isChecked ? Colors.green : UIConstant.kAvatar),
                child: CircleAvatar(
                  backgroundColor:
                      isChecked ? Colors.green : UIConstant.kAvatar,
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                      ),
                    ),
                  ),
                ),
              ),
              trailing: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: GFCheckbox(
                  size: GFSize.MEDIUM,
                  type: GFCheckboxType.square,
                  inactiveBgColor: UIConstant.kCFont,
                  inactiveBorderColor: UIConstant.kCFont,
                  activeBgColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                  value: isChecked,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Checkbox(
//                   value: isChecked,
//                   onChanged: (value) {
//                     setState(() {
//                       isChecked = value!;
//                     });
//                   },
//                 ),