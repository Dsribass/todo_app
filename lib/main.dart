
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'app/app_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TodoApp());
} 