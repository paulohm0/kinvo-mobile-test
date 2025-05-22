import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/enums/view_state.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';
import 'package:kinvo_mobile_test/shared/widgets/loading_error_wrapper.dart';
import 'package:kinvo_mobile_test/ui/private_pension/view_model/private_pensions_view_model.dart';
import 'package:kinvo_mobile_test/ui/private_pension/widgets/empty_list_pension.dart';
import 'package:kinvo_mobile_test/ui/private_pension/widgets/filter_pension.dart';
import 'package:kinvo_mobile_test/ui/private_pension/widgets/private_pension_card_widget.dart';
import 'package:provider/provider.dart';

class PrivatePensionView extends StatelessWidget {
  const PrivatePensionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Previdências', showBackButton: true),
        body: Consumer<PrivatePensionsViewModel>(
          builder: (context, viewModel, child) {
            return LoadingErrorWrapper(
              isLoading: viewModel.state == ViewState.loading,
              error:
                  viewModel.state == ViewState.error
                      ? viewModel.errorMessage
                      : null,
              onRetry: viewModel.fetchPensions,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 24.0,
                      ),
                      child: FilterPension(viewModel: viewModel),
                    ),
                    Divider(height: 1.0),
                    Expanded(
                      child:
                          viewModel.filteredPensions.isEmpty
                              ? EmptyListPension()
                              : ListView.builder(
                                itemCount: viewModel.filteredPensions.length,
                                itemBuilder: (context, index) {
                                  final pension =
                                      viewModel.filteredPensions[index];
                                  return PrivatePensionCardWidget(
                                    namePension: pension.name,
                                    typePension: pension.type,
                                    taxPension: pension.tax,
                                    minimumValuePension: pension.minimumValue,
                                    redemptionTermPension:
                                        pension.redemptionTerm,
                                    profitabilityPension: pension.profitability,
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
