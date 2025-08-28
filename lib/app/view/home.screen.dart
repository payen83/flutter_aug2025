import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  int total = 0;

  calculate(String operation){
    setState(() {
      if(operation == '+'){
        total = int.parse(num1Controller.text) + int.parse(num2Controller.text);
      } else {
        total = int.parse(num1Controller.text) - int.parse(num2Controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calculator', 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num1Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter first number'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num2Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter second number'
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.red
                  ),
                  child: IconButton(
                    onPressed: (){
                      calculate('+');
                    }, 
                    icon: Icon(Icons.add, color: Colors.white,)
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.red
                  ),
                  child: IconButton(
                    onPressed: (){
                      calculate('-');
                    }, 
                    icon: Icon(Icons.remove, color: Colors.white)
                  ),
                )
              ], 
            ),
            SizedBox(height: 20,),
            Text('Result: $total', style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}

