import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/data/datasources/private_pensions/private_pensions_datasource.dart';
import 'package:kinvo_mobile_test/data/models/private_pensions/private_pension_model.dart';

class PrivatePensionsViewModel extends ChangeNotifier {
  final PrivatePensionsDatasource datasource;

  PrivatePensionsViewModel(this.datasource);

  List<PrivatePensionModel> pensions = [];
  String? error;
  bool isLoading = false;

  Future<void> fetchPensions() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      pensions = await datasource.getPensions();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
