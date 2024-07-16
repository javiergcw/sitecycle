// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxController extends GetxController implements GetxService{
  var checkBox = [];
  bool  checkboxis = false;
  bool ismenuopen = false;
  int selectpage = 0;
  int loadmore = 7;

  ScrollController scrollController = ScrollController();

  setindexforitem(value){
    selectindex = value;
    update();
  }

  int selectindex = 10;

  setchekboxis(value){
    checkboxis = value;
    update();
  }

  selcetcheckbox(index){
    if(checkBox.contains(index)){
      checkBox.remove(index);
      update();
    }else{
      checkBox.add(index);
      update();
    }
  }

  setmenuu(value){
    ismenuopen = value;
    update();
  }


  setloadmore(value){
    loadmore = value;
    update();
  }

  setpage(value){
    selectpage = value;
    update();
  }

  List listtiletitle = [
    "New product",
    "Tital Product detail",
    "Learning Degine",
    "New product",
    "Tital Product detail",
    "Learning Degine",
    "New product",
    "Tital Product detail",
    "Learning Degine",
    "New product",
    "Tital Product detail",
    "Learning Degine",
    "New product",
    "Tital Product detail",
    "Learning Degine",
    "New product",
    "Tital Product detail",
    "Learning Degine",
  ];
  List date = [
    "Designer",
    "Editor",
    "Editor",
    "Developer",
    "Designer",
    "Designer",
    "Developer",
    "Developer",
    "Editor",
    "Designer",
    "Editor",
    "Editor",
    "Developer",
    "Designer",
    "Designer",
    "Developer",
    "Developer",
    "Editor",
  ];
  List year = [
    "2 years",
    "4 years",
    "8 years",
    "1 years",
    "3 years",
    "9 years",
    "10 years",
    "13 years",
    "5 years",
    "2 years",
    "3 years",
    "1 years",
    "4 years",
    "6 years",
    "8 years",
    "4 years",
    "3 years",
    "1 years",
  ];
  List clint = [
    "10",
    "15",
    "30",
    "40",
    "50",
    "25",
    "05",
    "15",
    "32",
    "54",
    "74",
    "12",
    "31",
    "54",
    "74",
    "12",
    "56",
    "78",
  ];
  List birthDate =[
    "Jan 05, 2022",
    "Jan 21, 2023",
    "July 15, 2021",
    "Dec 13, 2018",
    "Feb 24, 2014",
    "Sep 30, 2011",
    "Jan 05, 2022",
    "Jan 21, 2023",
    "July 15, 2021",
    "Dec 13, 2018",
    "Feb 24, 2014",
    "Sep 30, 2011",
    "Dec 13, 2018",
    "Feb 24, 2014",
    "Sep 30, 2011",
    "Jan 05, 2022",
    "Jan 21, 2023",
    "July 15, 2021",
  ];
  List address = [
    "Gujarat",
    "Singapore",
    "Canada",
    "Canada",
    "Singapore",
    "Gujarat",
    "Gujarat",
    "Singapore",
    "Canada",
    "Gujarat",
    "Singapore",
    "Canada",
    "Canada",
    "Singapore",
    "Gujarat",
    "Gujarat",
    "Singapore",
    "Canada",
  ];
  List timeJob = [
    "Full Time",
    "Remote",
    "Part Time",
    "Part Time",
    "Remote",
    "Remote",
    "Full Time",
    "Part Time",
    "Full Time",
    "Full Time",
    "Part Time",
    "Part Time",
    "Remote",
    "Remote",
    "Full Time",
    "Part Time",
    "Full Time",
    "Full Time",
  ];
}