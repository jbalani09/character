
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Image.asset('assets/image/loader.gif',height: 250,width: 250,fit: BoxFit.cover,),
          //8.height,
          // Text(
          //   "Please Wait",
          //   style: boldTextStyle(color: Colors.blue),
          // )
        ],
      ).center(),
    ).center();
  }
}