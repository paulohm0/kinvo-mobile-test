import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/data/datasources/private_pensions/private_pensions_datasource.dart';
import 'package:kinvo_mobile_test/data/models/private_pensions/private_pension_model.dart';

class PrivatePensionsViewModel extends ChangeNotifier {
  final PrivatePensionsDatasource datasource;

  PrivatePensionsViewModel(this.datasource);

  List<PrivatePensionModel> allPensions = [];
  List<PrivatePensionModel> filteredPensions = [];
  String? error;
  bool isLoading = false;
  String? selectedFilter;

  void applyFilter(String filter) {
    selectedFilter = filter;

    if (filter == 'SEM TAXA') {
      filteredPensions =
          allPensions.where((pension) => pension.tax == 0).toList();
    } else if (filter == 'R\$ 100,00') {
      filteredPensions =
          allPensions.where((pension) => pension.minimumValue == 100).toList();
    } else if (filter == 'D+1') {
      filteredPensions =
          allPensions.where((pension) => pension.redemptionTerm == 1).toList();
    }

    notifyListeners();
  }

  Future<void> fetchPensions() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      allPensions = await datasource.getPensions();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
