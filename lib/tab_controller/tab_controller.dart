import 'package:flutter/material.dart';
import 'package:task_2/tab_controller/tasks.dart';

class TabControllerScreen extends StatefulWidget {
  @override
  _TabControllerScreenState createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  List<Tasks> task = [
    Tasks('Playing games', true),
    Tasks('Sleeping enough time', true),
    Tasks('Eating lunch', true),
    Tasks('Calling your friend', true),
    Tasks('Go to the sea', false),
    Tasks('Watching film', false),
    Tasks('Training flutter', true),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(
              Icons.menu,
              size: 18,
            ),
            onTap: () {
              tabController.animateTo(1);
            },
          )
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: [
            Text(
              'All Tasks',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Completed Tasks',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              'In Completed Tasks',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
        title: Text('New App',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Column(
            children: task
                .map(
                  (tasks) => ToDoTasks(
                    tasks: tasks,
                    onChanged: (value) {
                      setState(() {
                        tasks.isCompleted = value;
                      });
                    },
                  ),
                )
                .toList(),
          ),
          Column(
            children: task
                .where((element) => element.isCompleted)
                .map((tasks) => ToDoTasks(
                      tasks: tasks,
                      onChanged: (value) {
                        setState(() {
                          tasks.isCompleted = value;
                        });
                      },
                    ))
                .toList(),
          ),
          Column(
            children: task
                .where((element) => !element.isCompleted)
                .map((tasks) => ToDoTasks(
                      tasks: tasks,
                      onChanged: (value) {
                        setState(() {
                          tasks.isCompleted = value;
                        });
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ToDoTasks extends StatelessWidget {
  final Tasks tasks;
  final Function onChanged;

  const ToDoTasks({Key key, this.tasks, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (tasks.isCompleted == true) ? Colors.green : Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 50,
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tasks.taskName,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Checkbox(
            activeColor: Colors.black,
            value: tasks.isCompleted,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
