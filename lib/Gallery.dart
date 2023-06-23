import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';

class myRay extends StatelessWidget {
  const myRay({super.key});

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
  late final imagepicker = ImagePicker();
  bool isImageSelected = false;
  String predictionResult = "";

  uploadGallery() async {
    setState(() {
      isImageSelected = true;
      predictionResult = "Loading";
    });
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {}

    // encode the image as base64 string
    final bytes = await image!.readAsBytes();
    final String img64 = base64Encode(bytes);

    // create the request body
    final Map<String, dynamic> body = {
      'image': img64,
    };

    // make the API request
    final response = await http.post(
      Uri.parse('http://132.145.71.167:5000/predict'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );

    // parse the response and get the prediction result
    final Map<String, dynamic> prediction =
        json.decode(response.body)['prediction'];
    setState(() {
      predictionResult = prediction['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
        title: Text(
          'X-Ray',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.topCenter,
            width: 100,
            height: 100,
            child: Center(
              child: ClipOval(child: Image.asset('images/o.jpg')),
            ),
          ),
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
          SizedBox(height: 30),
          predictionResult.isNotEmpty
              ? Text(
                  'Prediction Result: $predictionResult',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              : Container(),
          SizedBox(height: 40),
          if (!isImageSelected)
            Center(
              child: ElevatedButton(
                onPressed: uploadGallery,
                child: Text(
                  'X_Ray from Gallery',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
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
          if (isImageSelected)
            Center(
              child: Text(
                'You have selected an image',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          if (image != null)
            Center(
              child: ElevatedButton(
                onPressed: uploadGallery,
                child: Text(
                  'New X-Ray ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
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
            )
          else
            SizedBox()
        ],
      ),
    );
  }
}
