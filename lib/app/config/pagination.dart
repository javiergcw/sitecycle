import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitecycle/app/config/images.dart';

class PaginationController extends GetxController implements GetxService{
  var checkBoxs = [];
  var popupcolorchack = [];
  bool  checkboxis = false;
  bool ismenuopen = false;
  int selectpage = 0;
  int loadmore = 3;

  ScrollController scrollController = ScrollController();

  setloadmore(value){
    loadmore = value;
    update();
  }

  setpage(value){
    selectpage = value;
    update();
  }


  List name = [
    "Instagram UI",
    "Instagram UI",
    "Year Report",
    "Marketing",
    "Hotel Update",
    "Health com",
    "analytics",
    "Complex stable",
    "Instagram UI",
    "Instagram UI",
    "Year Report",
    "Marketing",
    "Hotel Update",
    "Health com",
    "analytics",
    "Complex stable",
  ];
  List statusImg =[
    Appcontent.approved,
    Appcontent.disable,
    Appcontent.error,
    Appcontent.approved,
    Appcontent.approved,
    Appcontent.disable,
    Appcontent.error,
    Appcontent.disable,
    Appcontent.error,
    Appcontent.approved,
    Appcontent.approved,
    Appcontent.error,
    Appcontent.approved,
    Appcontent.approved,
    Appcontent.disable,
    Appcontent.error,
    Appcontent.disable,
  ];
  List statusTitle = [
    "Approved",
    "Disable",
    "Error",
    "Approved",
    "Approved",
    "Disable",
    "Error",
    "Disable",
    "Error",
    "Approved",
    "Approved",
    "Error",
    "Approved",
    "Approved",
    "Disable",
    "Error",
  ];
  List quantity = [
    "4032",
    "4521",
    "551",
    "220",
    "205",
    "450",
    "503",
    "1200",
    "451",
    "3215",
    "4522",
    "5623",
    "4523",
    "145",
    "956",
    "780",
  ];
  List date = [
    "12/02/2021",
    "15/12/2023",
    "01/03/1996",
    "30/02/2021",
    "07/09/1991",
    "30/04/2024",
    "12/02/2021",
    "15/12/2023",
    "01/03/1996",
    "30/02/2021",
    "07/09/1991",
    "30/04/2024",
    "30/04/2024",
    "12/02/2021",
    "15/12/2023",
    "01/03/1996",
  ];



  setmenuu(value){
    ismenuopen = value;
    update();
  }

  int selectindex = 10;

  setindexforitem(value){
    selectindex = value;
    update();
  }

  setchekboxis(value){
    checkboxis = value;
    update();
  }

  selcetcheckbox(index){
    if(checkBoxs.contains(index)){
      checkBoxs.remove(index);
      update();
    }else{
      checkBoxs.add(index);
      update();
    }
  }
}