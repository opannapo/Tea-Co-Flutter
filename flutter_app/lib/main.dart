import 'package:flutter/material.dart';
import 'package:flutter_app/app/views/page/outlets/outlets_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test-teaco',
      theme: ThemeData(
        fontFamily: 'UbuntuMonoRegular',
        primaryColor: Colors.white,
        accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OutletsView(),
    );
  }
}
