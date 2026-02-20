import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback deleteFunction;
  final VoidCallback editFunction;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(taskName),
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) => deleteFunction(),
      child: GestureDetector(
        onTap: editFunction,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: taskCompleted
                ? LinearGradient(
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade700,
              ],
            )
                : LinearGradient(
              colors: [
                Colors.blueAccent.shade700,
                Colors.blueAccent.shade400,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.6),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.blue,
              ),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: deleteFunction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}