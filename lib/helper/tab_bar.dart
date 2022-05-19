

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../screen/controller/home_controller.dart';
import 'constant.dart';

class TabBar extends StatelessWidget {
  const TabBar({
    Key? key,
    required HomeController con,
  }) : _con = con, super(key: key);

  final HomeController _con;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _con.categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Obx(() {
            return GestureDetector(
              onTap: () {
                _con.selectedCategory.value = index;
                (index == 0)?{
                  _con.dummyData.value = _con.homeData,
                   (_con.searchValue != '')?{
                     _con.charactersData.value = _con.runFilter(_con.searchValue),
                   }:_con.charactersData.value = _con.homeData,
                }:null;
                (index == 1)?{
                  _con.dummyData.value = _con.houseData,
                  (_con.searchValue != '')?{
                    _con.charactersData.value = _con.runFilter(_con.searchValue),
                  }:_con.charactersData.value = _con.houseData,
                }:null;
                (index == 2)?{
                  _con.dummyData.value = _con.staffData,
                  (_con.searchValue != '')?{
                    _con.charactersData.value = _con.runFilter(_con.searchValue),
                  }:_con.charactersData.value = _con.staffData,
                }:null;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _con.categories[index],
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: index == _con.selectedCategory.value
                          ? kSecondaryColor
                          : kTextLightColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    height: 6,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == _con.selectedCategory.value
                          ? kSecondaryColor
                          : Colors.transparent,
                    ),
                  )
                ],
              ),
            );
          }
          ),
        ),
      ),
    );
  }
}