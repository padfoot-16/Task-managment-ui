import 'package:flutter/material.dart';
import 'package:managmentui/models/tasks_model.dart';

Future<void> showTaskDialog(BuildContext context) {
  DateTime selectedDate = DateTime.now();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  List<Category> categories = Category.generateTasks();
  Category? selectedCategory;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          scrollable: true,
          title: Text("Add a Task"),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Task description'),
              ),
              DropdownButton<Category>(
                hint: Text("Select Category"),
                value: selectedCategory,
                onChanged: (Category? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
                items: categories
                    .where((c) => !c.islast)
                    .map<DropdownMenuItem<Category>>((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.title ?? ''),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Due Date: ${selectedDate.toLocal().toString().split(' ')[0]}',
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Text('Pick Date'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String title = titleController.text;
                String desc = descController.text;
                if (title.isNotEmpty && selectedCategory != null) {
                  setState(() {
                    Task newtask = Task(
                        title: title,
                        subt: desc,
                        dueDate: selectedDate,
                        isdone: false);
                    selectedCategory!.tasks?.add(newtask);
                    selectedCategory!.left+=1;
                    print(selectedCategory!.left);
                  });
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        ),
      );
    },
  );
}
