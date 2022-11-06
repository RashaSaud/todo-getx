import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../C/todocontroller.dart';

var valuecontroller = TextEditingController();

class Todo extends StatelessWidget {
  var todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: valuecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'add your Task',
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                todoController.additem(valuecontroller.text);
                valuecontroller.clear();
              },
              child: Text('add')),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Obx(
              () {
                return ListView.builder(
                    itemCount: todoController.tasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                            title: Text('${todoController.tasks[index]}'),
                            leading: Checkbox(
                              value: todoController.isChecked[index],
                              onChanged: (value) {
                                todoController.isChecked[index] = value!;
                                todoController.tasks[index] =
                                    todoController.tasks[index];
                              },
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      content: TextFormField(
                                        controller: valuecontroller,
                                        decoration: InputDecoration(
                                          hintText: 'edit your task',
                                        ),
                                        onFieldSubmitted: ((value) {
                                          todoController.edititem(value, index);
                                          valuecontroller.clear();
                                          Navigator.pop(context, 'Cancel');
                                        }),
                                      ),
                                    ),
                                  ),
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    todoController.deleteitem(index);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            )),
                      );
                    });
              },
            ),
          ),
          Obx(() => Column(
                children: [
                  Text(
                      ' You have ${todoController.tasks.length} Task to do ! '),
                  Text(
                      'You have Completed ${todoController.isChecked.where((i) => i == true).length} Tasks ')
                ],
              ))
        ],
      ),
    );
  }
}
