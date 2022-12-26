import 'package:flutter/material.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}



