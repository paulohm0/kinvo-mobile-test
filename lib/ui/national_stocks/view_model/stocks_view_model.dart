import 'package:kinvo_mobile_test/data/datasources/stocks/stocks_datasource.dart';
import 'package:kinvo_mobile_test/data/models/stocks/stock_model.dart';
import 'package:kinvo_mobile_test/shared/enums/view_state.dart';
import 'package:kinvo_mobile_test/shared/view_model/base_view_model.dart';

class StocksViewModel extends BaseViewModel {
  final StockDatasource datasource;

  StocksViewModel(this.datasource);

  List<StockModel> stocks = [];
  Set<String> favoriteTickers = {};

  bool isFavorite(String ticker) => favoriteTickers.contains(ticker);

  void _sortStocks() {
    stocks.sort((stock1, stock2) {
      // retornar as ações em ordem alfabética e verifica se é  favorito ou nao
      final stock1Fav = isFavorite(stock1.ticker) ? 0 : 1;
      final stock2Fav = isFavorite(stock2.ticker) ? 0 : 1;
      final favComparison = stock1Fav.compareTo(
        stock2Fav,
      ); // compara se os dois stocks sao favoritos
      if (favComparison != 0) {
        return favComparison; // caso sejam diferentes, o favorito ganha prioridade na lista
      }
      return stock1.name.compareTo(
        stock2.name,
      ); // caso sejam iguais, retorna os dois em ordem alfabetica
    });
  }

  void toggleFavorite(String ticker) {
    if (favoriteTickers.contains(ticker)) {
      favoriteTickers.remove(ticker);
    } else {
      favoriteTickers.add(ticker);
    }
    _sortStocks();
    notifyListeners();
  }

  Future<void> fetchStocks() async {
    try {
      setState(ViewState.loading);
      stocks = await datasource.getStocks();
      setState(ViewState.success);
      _sortStocks();
    } catch (error) {
      setState(ViewState.error, 'Não foi possivel buscar a lista de Ações');
    }
    notifyListeners();
  }
}
