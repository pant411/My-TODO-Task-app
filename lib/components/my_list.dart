import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  final List<String> task;
  const MyListView({Key? key, required this.task}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  void removeTask(int index) {
    setState(() {
      widget.task.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.task.length,
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
              title: Text(widget.task[index]),
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
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      removeTask(index);
                    },
                  ),
                ],
              )),
        );
      },
    );
  }
}
