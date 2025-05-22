import 'package:kinvo_mobile_test/data/datasources/private_pensions/private_pensions_datasource.dart';
import 'package:kinvo_mobile_test/data/models/private_pensions/private_pension_model.dart';
import 'package:kinvo_mobile_test/shared/enums/view_state.dart';
import 'package:kinvo_mobile_test/shared/view_model/base_view_model.dart';

class PrivatePensionsViewModel extends BaseViewModel {
  final PrivatePensionsDatasource datasource;

  PrivatePensionsViewModel(this.datasource);

  List<PrivatePensionModel> allPensions = [];
  List<PrivatePensionModel> filteredPensions = [];
  List<String> selectedFilters = [];

  void applyFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter); // Remove se já estiver
    } else {
      selectedFilters.add(filter); // Adiciona se não estiver
    }

    filteredPensions =
        allPensions.where((pension) {
          // Se nenhum filtro estiver ativo, retorna tudo
          if (selectedFilters.isEmpty) return true;

          // Verifica se atende a TODOS os filtros
          return selectedFilters.every((f) {
            switch (f) {
              case 'SEM TAXA':
                return pension.tax == 0;
              case 'R\$ 100,00':
                return pension.minimumValue == 100.0;
              case 'D+1':
                return pension.redemptionTerm == 1;
              default:
                return true;
            }
          });
        }).toList();

    notifyListeners();
  }

  Future<void> fetchPensions() async {
    try {
      setState(ViewState.loading);
      allPensions = await datasource.getPensions();
      setState(ViewState.success);
      allPensions.sort(
        (pension1, pension2) =>
            pension1.name.toLowerCase().compareTo(pension2.name.toLowerCase()),
      );
      filteredPensions = allPensions;
    } catch (error) {
      setState(ViewState.error, 'Não foi possivel buscar as Previdências');
    }
    notifyListeners();
  }
}
