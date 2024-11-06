import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  const Todolist({
    super.key,
    required this.onDelete,
    required this.taskname,
    required this.onchanged,
    required this.taskcompleted,
  });

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onchanged;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (value) {
                onDelete();
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onchanged,
                checkColor: Colors.white,
                activeColor: Colors.black,
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              Text(
                taskname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskcompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
