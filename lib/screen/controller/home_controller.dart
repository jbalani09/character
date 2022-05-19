import 'dart:convert';

import 'package:character/main.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../networks/network_utils.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{

  RxInt selectedCategory = 0.obs;

  List<String> categories = ["Character", "House", "Staff"];

  RxList charactersData = [].obs;

  RxList houseData = [].obs;

  RxList staffData = [].obs;

  RxList homeData = [].obs;


  RxList dummyData = [].obs;

  String searchValue = '';

  Future<dynamic> getCharacter() async {
    appStore.setIsLoading(true);
    await getCharacterReq().then((value) async {
      charactersData.value = value;
      dummyData.value =  value;
      homeData.value = value;
      appStore.setIsLoading(false);
      print("VALUE LENGTH :${charactersData.length}");
    }).catchError((e) {
      toast(e.toString());
      appStore.setIsLoading(false);
      log(e);
    });
  }

  Future<dynamic> getCharacterReq() async {
    http.Response response = await buildHttpResponse('characters',
        request: {}, method: HttpMethod.GET);
    log(response.body);
    if (response.statusCode.isSuccessful()) {
      if (response.body.isJson()) {
        var json = jsonDecode(response.body);
        return json;
      }
    }
  }

  Future<dynamic> getHouse() async {
    appStore.setIsLoading(true);
    await getHouseReq().then((value) async {
      appStore.setIsLoading(false);
      houseData.value = value;
    }).catchError((e) {
      appStore.setIsLoading(false);
      toast(e.toString());
      log(e);
    });
  }

  Future<dynamic> getHouseReq() async {
    http.Response response = await buildHttpResponse('characters/house/gryffindor',
        request: {}, method: HttpMethod.GET);
    log(response.body);
    if (response.statusCode.isSuccessful()) {
      if (response.body.isJson()) {
        var json = jsonDecode(response.body);
        return json;
      }
    }
  }

  Future<dynamic> getStaff() async {
    appStore.setIsLoading(true);
    await getStaffReq().then((value) async {
      appStore.setIsLoading(false);
      staffData.value = value;
    }).catchError((e) {
      appStore.setIsLoading(false);
      toast(e.toString());
      log(e);
    });
  }

  Future<dynamic> getStaffReq() async {
    http.Response response = await buildHttpResponse('characters/staff',
        request: {}, method: HttpMethod.GET);
    log(response.body);
    if (response.statusCode.isSuccessful()) {
      if (response.body.isJson()) {
        var json = jsonDecode(response.body);
        return json;
      }
    }
  }


  runFilter(String enteredKeyword) {
    var results = [];
    if (enteredKeyword == '') {
      // if the search field is empty or only contains white-space, we'll display all users
      results = dummyData.value;
    }
    else{
      for (var productDetail in dummyData) {
        if (productDetail['name'].toLowerCase().contains(enteredKeyword.toLowerCase())) {
          results.add(productDetail);
        }
      }
    }
    return results;
  }

}