import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        shape: CircleBorder(),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          _Banner(),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Task List',
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.blueGrey
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(width: 10,),
                        Text('Task description')
                      ],
                    ),
                  )
                ),
              ],
            )
          )
        ],
      ),
    ); 
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // Banner
      flex: 3,
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image(
                image: AssetImage('assets/images/shapes.png'),
                width: 141,
                height: 129,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/tasks-list-image.png'),
                    width: 120,
                    height: 120,
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

