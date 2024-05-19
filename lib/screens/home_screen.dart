import 'package:flutter/material.dart';
import 'package:todo_app_tec/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  // TaskModel task1 = TaskModel(
  //     title: "AYA Task",
  //     subTutle: "Answer Aya q",
  //     isCompleted: false,
  //     createdAt: DateTime.now());

  List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.task),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Add New Task"),
                      content: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Title is Rquired";
                                }
                                if (value.length < 3) {
                                  return "Title Must bet more than 2 chars";
                                }
                                return null;
                              },
                              controller: titleController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Task Title here"),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "SubTitle is Rquired";
                                }
                                if (value.length < 3) {
                                  return "SubTitle Must bet more than 2 chars";
                                }
                                return null;
                              },
                              controller: subTitleController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Task Subtitle here"),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue)),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      tasks.add(TaskModel(
                                          createdAt: DateTime.now(),
                                          title: titleController.text,
                                          subTutle: subTitleController.text,
                                          isCompleted: false));

                                      titleController.clear();
                                      subTitleController.clear();
                                      setState(() {});
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    titleController.clear();
                                    subTitleController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.blue,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Waiting",
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    const Center(
                      child: Text("COMPLETED"),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(tasks[index].title.toString()),
                            subtitle: Text(tasks[index].createdAt.toString()),
                            trailing: Checkbox(
                              value: tasks[index].isCompleted,
                              onChanged: (status) {},
                            ),
                          );
                        })
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
