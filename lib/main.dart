import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practical3d/screen/add_new_record.dart';
import 'package:practical3d/screen/record_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecordListScreen(),
    );
  }
}
