import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/data/datasources/funds/funds_datasource.dart';
import 'package:kinvo_mobile_test/data/models/funds/fund_model.dart';
import 'package:kinvo_mobile_test/shared/enums/view_state.dart';
import 'package:kinvo_mobile_test/shared/view_model/base_view_model.dart';

class FundsViewModel extends BaseViewModel {
  final FundsDatasource datasource;

  FundsViewModel(this.datasource);

  List<FundModel> funds = [];

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
    try {
      setState(ViewState.loading);
      funds = await datasource.getFunds();
      funds.sort(
        (fund1, fund2) =>
            fund1.name.toLowerCase().compareTo(fund2.name.toLowerCase()),
      );
      setState(ViewState.success);
    } catch (error) {
      setState(
        ViewState.error,
        'Não foi possivel buscar os Fundos de Investimentos',
      );
    }
    notifyListeners();
  }
}
