import 'package:flutter/material.dart';

class ProjectInfor {
  ProjectInfor(this.title, this.pageNavigator, this.number);

  final String title;
  final String number;
  final String pageNavigator;
}

final List<ProjectInfor> dataProjectInforList = <ProjectInfor>[
  ProjectInfor('Buiding', 'Buiding', '5'),
  ProjectInfor('Rail', 'Rail', '5'),
  ProjectInfor('Road', 'Road', '5'),
  ProjectInfor('Pedestrian Bridge', 'Pedestrian Bridge', '5'),
  ProjectInfor('Subway Station', 'Subway Station', '5')
];

class ProjectInforDetail {
  ProjectInforDetail(this.title, this.pageNavigator);
  final String title;
  final String pageNavigator;
}



final List<ProjectInforDetail> dataProjectInforDetaiList = <ProjectInforDetail>[
  ProjectInforDetail('Circulation', 'Circulation'),
  ProjectInforDetail('Stairs A', 'Stairs A'),
  ProjectInforDetail('Stairs B', 'Stairs B'),
  ProjectInforDetail('Stairs C', 'Stairs C'),
  ProjectInforDetail('Unit 1213P', 'Unit 1213P'),
  ProjectInforDetail('Unit 1213P', 'Unit 1213P'),
  ProjectInforDetail('Unit 1213P', 'Unit 1213P'),
  ProjectInforDetail('Unit 1213P', 'Unit 1213P'),
  ProjectInforDetail('Unit 1213P', 'Unit 1213P'),
  ProjectInforDetail('Unit 1213P', 'Unit 1213P'),
  ProjectInforDetail('Unit 1213P', 'Unit 1213P'),
];

