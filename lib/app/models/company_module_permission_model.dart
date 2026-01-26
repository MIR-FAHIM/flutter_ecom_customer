// To parse this JSON data, do
//
//     final companyModulePerModel = companyModulePerModelFromJson(jsonString);

import 'dart:convert';

CompanyModulePerModel companyModulePerModelFromJson(String str) => CompanyModulePerModel.fromJson(json.decode(str));

String companyModulePerModelToJson(CompanyModulePerModel data) => json.encode(data.toJson());

class CompanyModulePerModel {
  String? status;
  PermissionsModule? permissions;

  CompanyModulePerModel({
     this.status,
     this.permissions,
  });

  factory CompanyModulePerModel.fromJson(Map<String, dynamic> json) => CompanyModulePerModel(
    status: json["status"],
    permissions: PermissionsModule.fromJson(json["permissions"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "permissions": permissions!.toJson(),
  };
}

class PermissionsModule {
  bool dashboard;
  bool hrms;
  bool attendance;
  bool task;
  bool project;
  bool prospect;
  bool client;
  bool sale;
  bool setting;

  PermissionsModule({
    required this.dashboard,
    required this.hrms,
    required this.attendance,
    required this.task,
    required this.project,
    required this.prospect,
    required this.client,
    required this.sale,
    required this.setting,
  });

  factory PermissionsModule.fromJson(Map<String, dynamic> json) => PermissionsModule(
    dashboard: json["dashboard"],
    hrms: json["hrms"],
    attendance: json["attendance"],
    task: json["task"],
    project: json["project"],
    prospect: json["prospect"],
    client: json["client"],
    sale: json["sale"],
    setting: json["setting"],
  );

  Map<String, dynamic> toJson() => {
    "dashboard": dashboard,
    "hrms": hrms,
    "attendance": attendance,
    "task": task,
    "project": project,
    "prospect": prospect,
    "client": client,
    "sale": sale,
    "setting": setting,
  };
}
