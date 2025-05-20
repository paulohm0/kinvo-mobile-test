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
    if (selectedFilter == filter) {
      // Se já estiver selecionado, limpa o filtro
      selectedFilter = null;
      filteredPensions = allPensions;
    } else {
      selectedFilter = filter;
      filteredPensions =
          allPensions.where((pension) {
            switch (filter) {
              case 'SEM TAXA':
                return pension.tax == 0;
              case 'R\$ 100,00':
                return pension.minimumValue == 100.0;
              case 'D+1':
                return pension.redemptionTerm == 1;
              default:
                return true;
            }
          }).toList();
    }
    notifyListeners();
  }

  Future<void> fetchPensions() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      allPensions = await datasource.getPensions();
      allPensions.sort(
        (pension1, pension2) =>
            pension1.name.toLowerCase().compareTo(pension2.name.toLowerCase()),
      );
      filteredPensions = allPensions;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
