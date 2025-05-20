import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/ui/private_pension/view_model/private_pensions_view_model.dart';

import 'filter_buttom.dart';

class FilterPension extends StatelessWidget {
  final PrivatePensionsViewModel viewModel;
  const FilterPension({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterButtom(
          label: 'SEM TAXA',
          isSelected: viewModel.selectedFilter == 'SEM TAXA',
          onTap: () => viewModel.applyFilter('SEM TAXA'),
        ),
        FilterButtom(
          label: 'R\$ 100,00',
          isSelected: viewModel.selectedFilter == 'R\$ 100,00',
          onTap: () => viewModel.applyFilter('R\$ 100,00'),
        ),
        FilterButtom(
          label: 'D+1',
          isSelected: viewModel.selectedFilter == 'D+1',
          onTap: () => viewModel.applyFilter('D+1'),
        ),
      ],
    );
  }
}
