import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            title: Center(child: Text('Ask Me Anything')),
            backgroundColor: Colors.blue[700],
          ),
          body: MagikPage(),
        ),
      )
  );
}

class MagikPage extends StatefulWidget {
  const MagikPage({Key? key}) : super(key: key);

  @override
  _MagikPageState createState() => _MagikPageState();
}

class _MagikPageState extends State<MagikPage> {
  int number = 1;
  void changeImage(){
    setState(() {
      number = Random().nextInt(5)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children: [
         SizedBox(
           width: 300.0,
           child: Padding(
             padding: const EdgeInsets.all(16.0),
             child: TextFormField(
               decoration: const InputDecoration(
                 hintText: 'Enter your Query',
               ),
               validator: (String? value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter some text';
                 }
                 return null;
               },
             ),
           ),
         ),
         Expanded(
           child: Center(
             child: Image(
                image: AssetImage('images/ball$number.png'),
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 14.0),
           child: ElevatedButton(
             onPressed: () {
               changeImage();
             },
             child: const Text('Submit'),
           ),
         ),
       ],
     ),
    );
  }
}




