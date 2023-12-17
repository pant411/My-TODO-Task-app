import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_2/components/new_edit_task.dart';
import '../states/providers/task.provider.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskProvider>(context).tasks;
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (BuildContext context, int index) {
        // Add space between ListTiles
        return const SizedBox(
            height: 8.0); // Adjust the height according to your needs
      },
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(10.0), // Set your desired border-radius
            border: Border.all(
              color: Colors.blueGrey, // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: ListTile(
              title: Text(tasks[index].title),
              tileColor: const Color.fromARGB(255, 198, 236, 252),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              trailing: Row(
                mainAxisSize:
                    MainAxisSize.min, // Ensure the row takes minimum space
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // widget.showModalForm(context, index);
                      showModalForm(context, index, tasks[index].title);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // removeTask(index);
                      Provider.of<TaskProvider>(context, listen: false)
                          .removeTask(index);
                    },
                  ),
                ],
              )),
        );
      },
    );
  }

  void showModalForm(BuildContext context, int index, String existValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewEditTaskForm(index: index, existValue: existValue);
      },
    );
  }
}
