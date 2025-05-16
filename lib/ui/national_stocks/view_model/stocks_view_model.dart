import 'package:flutter/cupertino.dart';
import 'package:kinvo_mobile_test/data/datasources/stocks_datasources.dart';
import 'package:kinvo_mobile_test/data/models/stocks/stock_model.dart';

class StocksViewModel extends ChangeNotifier {
  final StockDataSources datasource;

  StocksViewModel(this.datasource);

  List<StockModel> stocks = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchStocks() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      stocks = await datasource.getStocks();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
