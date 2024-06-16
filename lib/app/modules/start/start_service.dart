import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mobx/mobx.dart';
import 'package:tractian_app/app/modules/splash/events/get_companies_event.dart';
import 'package:tractian_app/app/shared/models/asset_model.dart';
import 'package:tractian_app/app/shared/models/company_model.dart';
import 'package:tractian_app/app/shared/models/local_model.dart';
import 'package:tractian_app/main.dart';

class StartService {
  final Dio dio = Dio();
  final EventBus _eventBus;
  List<CompanyModel> companies = [];
  StartService(this._eventBus) {
    _eventBus.on<GetCompaniesEvent>().listen((event) async {
      log("> GetCompaniesEvent is Called!");
      await getCompanies();
    });
  }

  @action
  getCompanies() async {
    final response = await dio.get('$baseUrl/companies');
    if (response.statusCode == 200 || response.statusCode == 201) {
      companies = CompanyModel.fromJsonArray(response.data);
    }
    return null;
  }

  @action
  getLocations(String companyId) async {
    final response = await dio.get('$baseUrl/companies/$companyId/locations');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LocalModel.fromJsonArray(response.data);
      // companies = CompanyModel.fromJsonArray(response.data);
    }
    return null;
  }

  @action
  getAssets(String companyId) async {
    final response = await dio.get('$baseUrl/companies/$companyId/assets');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AssetModel.fromJsonArray(response.data);
    }
    return null;
  }
}
