import 'package:flutter/material.dart';
import 'package:flutter_template/app/controller.dart';
import 'package:flutter_template/resource/color_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Controller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      alignment: Alignment.center,
      child: Text(
        "username: ${ctrl.username}",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
