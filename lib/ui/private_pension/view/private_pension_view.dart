import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';
import 'package:kinvo_mobile_test/shared/widgets/loading_error_wrapper.dart';
import 'package:kinvo_mobile_test/ui/private_pension/view_model/private_pensions_view_model.dart';
import 'package:provider/provider.dart';

class PrivatePensionView extends StatelessWidget {
  const PrivatePensionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Previdências', showBackButton: true),
        body: Consumer<PrivatePensionsViewModel>(
          builder: (context, viewModel, _) {
            return LoadingErrorWrapper(
              isLoading: viewModel.isLoading,
              error: viewModel.error,
              child: ListView.builder(
                itemCount: viewModel.pensions.length,
                itemBuilder: (context, index) {
                  final pension = viewModel.pensions[index];
                  return ListTile(
                    title: Text(pension.name),
                    subtitle: Text(pension.type),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
