import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xfffbc7d4)),
      ),
      home: ToDoHome(),
    );
  }
}

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  var ToDos = ["Muhammad Abdul Ahad Khan"];
  var output = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      // Container(
      //   decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Color(0xff9796f0), Color(0xfffbc7d4)],
      //     stops: [0, 1],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   )
      AppBar(title: Text('ToDo App')),

      // ),);
      body: ListView.builder(
        itemCount: ToDos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(ToDos[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Update Your Data"),
                          content: TextField(
                            onChanged: (value) {
                              output = value;
                            },
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ToDos.replaceRange(index, index + 1, {
                                    output,
                                  });
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("Update"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.edit),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ToDos.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Enter Your Task"),
                content: TextField(
                  onChanged: (value) {
                    output = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ToDos.add(output);
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
