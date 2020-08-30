import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    if(task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }


  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return new ListTile(
        title: new Text(todoText)
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(
                      title: new Text('Add a new task')
                  ),
                  body: new TextField(
                    autofocus: true,
                    onSubmitted: (val) {
                      _addTodoItem(val);
                      Navigator.pop(context);
                    },
                    decoration: new InputDecoration(
                        hintText: 'Enter something to do...',
                        contentPadding: const EdgeInsets.all(16.0)
                    ),
                  )
              );
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue,
              width: 3
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Scaffold(
          body: _buildTodoList(),
          floatingActionButton: new FloatingActionButton(
              onPressed: _pushAddTodoScreen,
              tooltip: 'Add task',
              child: new Icon(Icons.add)
          ),
        ),
      ),
    );
  }
}
