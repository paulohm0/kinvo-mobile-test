import 'package:flutter/cupertino.dart';
import 'package:kinvo_mobile_test/data/datasources/funds/funds_datasource.dart';
import 'package:kinvo_mobile_test/data/models/funds/fund_model.dart';

class FundsViewModel extends ChangeNotifier {
  final FundsDatasource datasource;

  FundsViewModel(this.datasource);

  List<FundModel> funds = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchFunds() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      funds = await datasource.getFunds();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
