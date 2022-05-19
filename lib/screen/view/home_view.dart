import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../helper/appLoader.dart';
import '../../helper/characterListView.dart';
import '../../helper/constant.dart';
import '../../main.dart';
import '../controller/home_controller.dart';
import '../../helper/tab_bar.dart' as tab;


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final _con = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _con.getHouse();
    _con.getStaff();
    _con.getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  backgroundColor,
      appBar: AppBar(
        toolbarHeight: gHeight * 0.11,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Container(
          height: gHeight * 0.06,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.06),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: TextField(
              style: TextStyle(color: Colors.grey.shade200),
              onChanged: (value){
                _con.searchValue = value;
                _con.charactersData.value =  _con.runFilter(_con.searchValue);
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(icon: const Icon(Icons.search_rounded,color: Colors.white,),onPressed: (){
                },),
                hintText: "Search with name",
                hintStyle: TextStyle(color: Colors.grey.shade200),
                border: InputBorder.none
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              tab.TabBar(con: _con),
              CharacterListView(con: _con)
            ],
          ),
          Obx(
            () => const AppLoader().visible(appStore.isLoading.value)),
        ],
      ),
    );
  }
}




