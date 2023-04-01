import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';




class MyRay extends StatelessWidget {
 const MyRay({super.key});

 
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   home: const Ray(),
  debugShowCheckedModeBanner: false,
 );
}
}

class Ray extends StatefulWidget {
 const Ray({Key? key}) : super(key: key);

 @override
State<Ray> createState() => _RayState();
}

class _RayState extends State<Ray> {
  File? image;
final imagepicker = ImagePicker();
 uploadImage() async {
 var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

 if (pickedImage != null) {
  setState(() {
   image = File(pickedImage.path);
   });
 } else {}
}

 uploadGallery() async {
 var pickedImage =
     await ImagePicker().pickImage(source: ImageSource.gallery);

 if (pickedImage != null) {
 setState(() {
  image = File(pickedImage.path);
 });
 } else {}
}

  @override
 Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    title: Text(
 'X_Ray',
  style: TextStyle(
       fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
 ),
centerTitle: true,
 leading: Icon(Icons.menu),
 actions: [
   IconButton(
       onPressed: onNotification,
    icon: Icon(
       Icons.notification_important,
      size: 30,
    )),
 IconButton(
 onPressed: () {
    print('hello');
  },
 icon: Icon(
    Icons.search,
   size: 30,
 ))
],
 ),
 body: Column(
  children: [
  SizedBox(
      height: 100,
   ),
   image == null
    ? Text(
       'Not choosen Image',
      style: TextStyle(
      fontSize: 30,
        color: Colors.black,
       fontWeight: FontWeight.bold),
   )
      : Container(
     margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(),
       borderRadius: BorderRadius.circular(15),
     ),
     width: 400,
   height: 300,
 child: Image.file(
       image!,
    ),
    ),
  SizedBox(height: 200),
      Center(
      child: ElevatedButton(
    onPressed: uploadGallery,
     child: Text(
     'X_Ray from Gallery',
      style: TextStyle(
        fontSize: 30,
      color: Colors.black,
   ),
  ),
      style: ElevatedButton.styleFrom(
             primary: Colors.blue,
         padding: EdgeInsets.all(
            10,
        ),
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))),
   ),
  ),
 SizedBox(
    height: 20,
  ),
 Center(
  child: ElevatedButton(
    onPressed: uploadImage,
   child: Text(
    'X_Ray from Camera',
     style: TextStyle(
        fontSize: 30,
       color: Colors.black,
     ),
   ),
   style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    padding: EdgeInsets.all(
    10,
     ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10))),
  ),
  ),
 ],
 ),
);
 }

 void onNotification() {
   print('hello');
}
}


