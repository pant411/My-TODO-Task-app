import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_2/states/providers/task.provider.dart';

class NewEditTaskForm extends StatefulWidget {
  final int index;
  final String existValue;
  const NewEditTaskForm({super.key, this.index = -1, this.existValue = ''});
  @override
  State<NewEditTaskForm> createState() => _NewEditTaskFormState();
}

class _NewEditTaskFormState extends State<NewEditTaskForm> {
  final TextEditingController _textController = TextEditingController();

  // Set initial text when the widget is created
  @override
  void initState() {
    super.initState();
    // Set your initial text here
    _textController.text = widget.existValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add Task',
        style: TextStyle(fontSize: 18),
      ),
      content: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Enter task'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check if the input is empty
                  if (_textController.text.isNotEmpty) {
                    // Handle form submission
                    String inputValue = _textController.text;
                    if (widget.index == -1) {
                      // Add your logic here
                      taskProvider.addTask(inputValue);
                    } else {
                      taskProvider.updateTask(widget.index, inputValue);
                    }

                    // Close the modal form
                    Navigator.of(context).pop();
                    // Clear the text field
                    _textController.clear();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
