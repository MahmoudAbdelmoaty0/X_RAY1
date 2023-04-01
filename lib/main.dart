
import 'dart:html';

import 'package:flutter/material.dart';
import'package:world/image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home:HomePage(),
      
    );
  }
}

class HomePage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('My App'),
      ),
      body:
    
     
Container(
  
  
  
  
  
  child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        
        
      
        children: [

          Center(child: 
          Container(
           width: 200, 
            height: 30,
            
            margin: EdgeInsets.all(40),
             
       
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
primary: Color.fromARGB(255, 37, 28, 3)



          ),
          child: Text('Start',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.white),),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyRay()),
            );
          },
        ),
      ),
          ),
      ],),),
    );
  }
}


