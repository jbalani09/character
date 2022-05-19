

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screen/controller/home_controller.dart';
import 'constant.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({
    Key? key,
    required HomeController con,
  }) : _con = con, super(key: key);

  final HomeController _con;

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
          return Expanded(
            child: (_con.searchValue != '' && _con.charactersData.isEmpty)?const Center(child: Text('Sry No Result Found :(',style: TextStyle(color: kSecondaryColor,fontSize: 20),),):ListView.builder(
              shrinkWrap: true,
              itemCount: _con.charactersData.length,
              controller: ScrollController(),
              itemBuilder: (context, index) => Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,left: 12.0,right: 12.0,bottom: 15),
                    child: Container(height: gHeight*0.13,width: gWidth,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.04),
                              offset: Offset(-6.0, -6.0),
                              blurRadius: 16.0,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: Offset(6.0, 6.0),
                              blurRadius: 16.0,
                            ),
                          ],
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: kDefaultPadding -5,top: kDefaultPadding/2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(_con.charactersData[index]['name'],style: const TextStyle(color: kSecondaryColor,fontSize: 20),),
                            8.height,
                            SizedBox(
                              width: gWidth * 0.54,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextIcon(text: (_con.charactersData[index]['house'] == '')?'None':_con.charactersData[index]['house'],prefix: const Icon(Icons.house_outlined,color: kTextLightColor,size: 20),textStyle: const TextStyle(color: kTextLightColor,fontSize: 15),edgeInsets: EdgeInsets.zero,),
                                  TextIcon(text: (_con.charactersData[index]['ancestry'] == '')?"Blood Line":_con.charactersData[index]['ancestry'],prefix: const Icon(Icons.bloodtype,color: kTextLightColor,size: 20,),textStyle: const TextStyle(color: kTextLightColor,fontSize: 15),edgeInsets: EdgeInsets.zero),
                                ],
                              ),
                            ),
                            8.height,
                            SizedBox(
                              width: gWidth * 0.54,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextIcon(text: (_con.charactersData[index]['dateOfBirth'] == '')?"not available":_con.charactersData[index]['dateOfBirth'],prefix: const Icon(Icons.calendar_today,color: kTextLightColor,size: 20),textStyle: const TextStyle(color: kTextLightColor,fontSize: 15),edgeInsets: EdgeInsets.zero,),
                                  TextIcon(text: (_con.charactersData[index]['gender'] == '')?"None":_con.charactersData[index]['gender'],prefix: const Icon(Icons.person,color: kTextLightColor,size: 20,),textStyle: const TextStyle(color: kTextLightColor,fontSize: 15),edgeInsets: EdgeInsets.zero),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),),
                  ),
                  Container(height: 100,width: 150,decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                      image: (_con.charactersData[index]['image'] != '')?DecorationImage(image: NetworkImage(_con.charactersData[index]['image'])):null
                  ),)
                ],
              ),),
          );
        }
    );
  }
}