import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:core';
import 'package:world/Gallery.dart';
import 'package:world/image.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:linkify/linkify.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AnimatedSplashScreen(
          splash: ClipOval(child: Image.asset('images/lo.png')),
          duration: 3000,
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.white,
          nextScreen: MyHomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _showOption(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Make a choice'),
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                    title: Text('Gallery'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => myRay()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.camera,
                      color: Colors.green,
                    ),
                    title: Text('Camera'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyRay()),
                      );
                    },
                  )
                ],
              )),
            ));
  }

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("X_Ray"),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 100,
                    height: 100,
                    child: Center(
                      child: ClipOval(child: Image.asset('images/o.jpg')),
                    ),
                  ),
                  Container(
                      width: 400,
                      height: 350,
                      child: Image.asset('images/we.jpg')),
                  Container(
                    width: 350,
                    height: 200,
                    child: Text(
                      "Welcome to our application! We are delighted that you have"
                      " chosen to use our services,and we hope that"
                      "you will find everything you need here.We strive to"
                      "provide you with a unique user experience,and we are"
                      "always ready to help if you have any questions or"
                      "concerns."
                      "Dont hesitate to reach out to us at any"
                      "time."
                      "Thank you for choosing our application.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  Column(children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Disease description and prevention',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Description of the disease:',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(13),
                      child: Text(
                        "Pneumonia is a form of acute respiratory infection that affects the lungs."
                        "The lungs are made up of small sacs called alveoli, which fill with air when a healthy person breathes."
                        "When an individual has pneumonia,"
                        "the alveoli are filled with pus and fluid,"
                        "which makes breathing painful and limits oxygen intake.",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'protection from disease:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(13),
                      child: Text(
                        'Good hygiene (washing your hands often), quitting smoking, '
                        'and keeping your immune system strong by getting regular physical '
                        'activity and eating healthy are other ways to '
                        'lower your risk of getting pneumonia.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ]),
                  Column(children: [
                    Center(
                      child: Text(
                        'This is a X-Ray of a person with pneumonia',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 400,
                        height: 300,
                        child: Image.asset('images/img.jpg')),
                    Divider(
                      color: Colors.black,
                    ),
                  ]),
                  Column(children: [
                    Container(
                      child: Text(
                        "Description and prevention by  this site",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Linkify(
                        text:
                            'Made by https://www.mayoclinic.org/ar/diseases-conditions/pneumonia/symptoms-causes/syc-20354204',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        onOpen: _onOpen,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: SelectableLinkify(
                        text:
                            'Made by https://www.who.int/ar/news-room/fact-sheets/detail/pneumonia',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        onOpen: _onOpen,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 200,
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور مني منصور",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص: استاذ جامعى تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان: شارع التسعين الشمالي التجمع الخامس القاهرة الجديدة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "     رقم الموبايل: 01201111344",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور سيد الاطروشي",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استاذ جامعى تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:مدينه نصر ٧ عمارات الشركه السعوديه ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور محمد ناجي عبد السميع",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:أستاذ جامعي تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:المهندسين ٦شارع التحرير بالدقي امام محطة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور خالد حسين",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:أستاذ جامعي تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان: المهندسين 19 شارع البطل أحمد عبد العزيز ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور مجدي خليل",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استاذ جامعى تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:شارع التسعين الشمالي التجمع الخامس القاهرة الجديدة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور خالد حليمة",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استاذ مساعد تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:شارع التسعين الشمالي التجمع الخامس القاهرة الجديدة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور راجي ممدوح غالي",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استشاري تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:شارع التسعين الشمالي التجمع الخامس القاهرة الجديدة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور طاهر النجار",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "تخصص:استاذ جامعى تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:شارع التسعين الشمالي التجمع الخامس القاهرة الجديدة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور اسامة محمد",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استشاري الامراض الصدرية",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:شارع التسعين الشمالي - التجمع الخامس - القاهرة الجديدة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور عبد المنعم الرملي",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:إستشارى تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:المعادى 34 شارع الجزائر المعادي",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور محمد عبد المنعم جبر",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:مدرس جامعي تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:مدينه نصر عماره ٨ بلوك ١٨ شارع ٤ حى الواحه مدينه نصر",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور طارق محفوظ",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استشاري وأستاذ الأمراض الصدرية",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:القاهرة الجديدة (التجمع) مركز c.m.c خلف المستشفى الجوي ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور حسن محمود امين",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:أستاذ أمراض صدرية بالقصر العيني",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:وسط البلد ٥ شارع شريف وسط البلد امام وزارة الأوقاف",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور محمد احمد فرج",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص: صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:حدائق القبه ١٨ مساكن القبه الجديده",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور أحمد ممدوح",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استشاري تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:القاهرة الجديدة (التجمع) مبني سي ام سي ش ال90",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور محمد عبد السلام",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:مدرس مساعد تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:مدينه العبور مدينة العبور شارع طه حسين مبني الخدمات",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور حسام العيسوى",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استاذ جامعى تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:القاهرة الجديدة (التجمع) التجمع الأول",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور أحمد الحسيني",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استاذالصدر ب طب القصرالعيني",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:المنيل 11 شارع محمد فريد وجدي بجوار مستشفي الندي",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور سيد لبيب العطاري",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:أستاذ واستشاري أمراض الصدر والحساسية بكلية الطب",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:مام مطعم دنيا الجمبري ميدان حلمية الزيتون القاهرة",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text("رقم الموبايل:01201111344",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "دكتور مروة عبد الحي",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "تخصص:استشاري تخصص صدر وجهاز تنفسي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "العنوان:مدينتى مدينتي المركز الطبي ١ بجوار اولاد رجب ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "رقم الموبايل:01201111344",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      'Description of Application',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'This application check the X-Ray chest for patients person and make sure the results according to '
                      'a deep learning Algorithm conventional neural network[CNN] this Algorithm'
                      'worked by take X-Ray chest image and worked on it according to futures extraction.'
                      '',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'This Application developed and designed by Al team in Culture and Science City 6 0ct',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(
                Icons.home,
              )),
          BottomNavyBarItem(title: Text('Protection'), icon: Icon(Icons.apps)),
          BottomNavyBarItem(
              title: Text('Help Doctor'), icon: Icon(Icons.add_box)),
          BottomNavyBarItem(
              title: Text('Description'), icon: Icon(Icons.account_box)),
        ],
      ),
      floatingActionButton: SizedBox(
          width: 60,
          height: 70,
          child: FloatingActionButton(
            onPressed: () => _showOption(context),
            child: Icon(
              Icons.add_photo_alternate,
              size: 40,
            ),
          )),
    );
  }
}

Future<void> _onOpen(LinkableElement link) async {
  if (!await launchUrl(Uri.parse(link.url))) {
    throw Exception('Could not launch ${link.url}');
  }
}
