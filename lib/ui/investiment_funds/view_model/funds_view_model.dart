import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/data/datasources/funds/funds_datasource.dart';
import 'package:kinvo_mobile_test/data/models/funds/fund_model.dart';

class FundsViewModel extends ChangeNotifier {
  final FundsDatasource datasource;

  FundsViewModel(this.datasource);

  List<FundModel> funds = [];
  bool isLoading = false;
  String? error;

  bool isClosedFund(int status) => status == 2;

  Color getStatusColor(int status) {
    switch (status) {
      case 1:
        return AppColors.blue;
      case 2:
        return AppColors.grey;
      default:
        return AppColors.transparent;
    }
  }

  String getStatusText(int status) {
    switch (status) {
      case 1:
        return 'Novo';
      case 2:
        return 'Fechado';
      default:
        return '';
    }
  }

  Future<void> fetchFunds() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      funds = await datasource.getFunds();
      funds.sort(
        (fund1, fund2) =>
            fund1.name.toLowerCase().compareTo(fund2.name.toLowerCase()),
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
