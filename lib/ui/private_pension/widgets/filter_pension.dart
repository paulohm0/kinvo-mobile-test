import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/ui/private_pension/view_model/private_pensions_view_model.dart';

class FilterPension extends StatelessWidget {
  final PrivatePensionsViewModel viewModel;

  const FilterPension({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFilterButton('SEM TAXA'),
        _buildFilterButton('R\$ 100,00'),
        _buildFilterButton('D+1'),
      ],
    );
  }

  Widget _buildFilterButton(String label) {
    final bool isSelected = viewModel.selectedFilter == label;

    return ElevatedButton(
      onPressed: () => viewModel.applyFilter(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.deepPurple : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: StadiumBorder(),
        elevation: 0,
        minimumSize: Size(100, 40),
      ),
      child: Text(label),
    );
  }
}
