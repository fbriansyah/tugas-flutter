import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/take_picture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(
              builder: (_) => HomeScreen(title: 'Flutter Demo Home Page'));
        case '/camera':
          return MaterialPageRoute(
              builder: (_) => TakePictureScreen(camera: firstCamera));
        default:
          return MaterialPageRoute(
              builder: (_) => HomeScreen(title: 'Flutter Demo Home Page'));
      }
    },
  ));
}
