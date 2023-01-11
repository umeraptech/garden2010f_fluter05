import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _todoList = <String>[];
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            final item = _todoList[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction){
                setState(() {
                  _todoList.removeAt(index);
                });
                ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              child: Card(
                child: ListTile(
                  title: Text(item),
                  trailing: const Icon(
                    Icons.delete,
                  ),
                  onLongPress: (){
                    setState(() {
                      _todoList.remove(item);
                    });
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayDialog,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addToDoListItem(String item) {
    setState(() {
      _todoList.add(item);
    });
    _textEditingController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                  hintText: 'Enter your task',
                  prefixIcon: Icon(Icons.note_add)),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _addToDoListItem(_textEditingController.text);
                },
                child: const Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _textEditingController.clear();
                },
                child: const Text('Cancel'),
              )
            ],
          );
        });
  }
}
