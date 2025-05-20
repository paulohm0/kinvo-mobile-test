import 'package:flutter/material.dart';

class LoadingErrorWrapper extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final Widget child;

  const LoadingErrorWrapper({
    super.key,
    required this.isLoading,
    required this.error,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (error != null) return Center(child: Text('Erro: $error'));
    return child;
  }
}
