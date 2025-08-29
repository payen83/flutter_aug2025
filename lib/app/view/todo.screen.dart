import 'package:flutter/material.dart';
import 'package:flutter_aug2025/app/model/task.model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  final taskList = <Task>[
    Task('Do laundry'),
    Task('Cook dinner'),
    Task('Wash Car'),
  ];

  onTaskCreated(Task task){
    setState(() {
      taskList.add(task);
    });
  }

  void showNewTaskModal(){
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              H1(h1Text: 'New Task',),
              SizedBox(height: 26,),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18)
                  )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: (){
                  if(_controller.text.isNotEmpty){
                    final task = Task(_controller.text);
                    onTaskCreated(task);
                    _controller.text = '';
                    Navigator.of(context).pop();
                  }
                }, 
                child: Text('Submit')
              )   
            ], 
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showNewTaskModal();
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
                    child: H1(h1Text: 'Task List',)
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: taskList.length,
                    itemBuilder: (_, index) => _TaskItem(taskList[index]),
                    separatorBuilder: (_,__) => SizedBox(height: 16,),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    ); 
  }
}

class _TaskItem extends StatefulWidget {
  const _TaskItem(this.task);

  final Task task;

  @override
  State<_TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<_TaskItem> {

  void onTaskDoneChange(Task task){
    setState(() {
      task.done = !task.done;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTaskDoneChange(widget.task),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Row(
            children: [
              Icon(widget.task.done ? Icons.check_box : Icons.check_box_outline_blank),
              SizedBox(width: 10,),
              Text(widget.task.title)
            ],
          ),
        )
      ),
    );
  }
}

class H1 extends StatelessWidget {
  const H1({
    super.key, required this.h1Text
  });

  final String h1Text;

  @override
  Widget build(BuildContext context) {
    return Text(
      h1Text,
      style: TextStyle(
        fontSize: 18, 
        fontWeight: FontWeight.bold, 
        color: Colors.blueGrey
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

