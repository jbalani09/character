import 'package:character/helper/bindings.dart';
import 'package:character/screen/view/home_view.dart';
import 'package:character/store/AppStore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


AppStore appStore = AppStore();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      title: 'Character',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

