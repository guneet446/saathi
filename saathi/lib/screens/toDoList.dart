import 'package:flutter/material.dart';
import 'package:saathi/main.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  void _removeTodoItem(int index) {
    setState(() => tasks.removeAt(index));
  }

// Show an alert dialog asking the user to confirm that the task is done
  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Mark "${tasks[index]}" as done?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()
                ),
                new FlatButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    }
                )
              ]
          );
        }
    );
  }

  void _addTodoItem(String task) {
    if(task.length > 0) {
      setState(() => tasks.add(task));
    }
  }


  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index < tasks.length) {
          return _buildTodoItem(tasks[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
        title: new Text(todoText),
        onTap: () => _promptRemoveTodoItem(index)
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(
                    backgroundColor: Color(0xff84a59d),
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
              color: Color(0xff84a59d),
              width: 3
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Scaffold(
          body: _buildTodoList(),
          floatingActionButton: new FloatingActionButton(
              backgroundColor: Color(0xff84a59d),
              onPressed: _pushAddTodoScreen,
              tooltip: 'Add task',
              child: new Icon(Icons.add)
          ),
        ),
      ),
    );
  }
}
