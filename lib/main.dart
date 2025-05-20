import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/data/datasources/funds/funds_datasource.dart';
import 'package:kinvo_mobile_test/data/datasources/private_pensions/private_pensions_datasource.dart';
import 'package:kinvo_mobile_test/data/datasources/stocks/stocks_datasource.dart';
import 'package:kinvo_mobile_test/ui/home/view/home_view.dart';
import 'package:kinvo_mobile_test/ui/investiment_funds/view/investiment_funds_view.dart';
import 'package:kinvo_mobile_test/ui/investiment_funds/view_model/funds_view_model.dart';
import 'package:kinvo_mobile_test/ui/national_stocks/view/national_stocks_view.dart';
import 'package:kinvo_mobile_test/ui/national_stocks/view_model/stocks_view_model.dart';
import 'package:kinvo_mobile_test/ui/private_pension/view/private_pension_view.dart';
import 'package:kinvo_mobile_test/ui/private_pension/view_model/private_pensions_view_model.dart';
import 'package:provider/provider.dart';

import 'core/services/dio_client.dart';

// O StockViewModel precisa do Dio para poder bater na api, por isso é criado uma instancia do Dio
// Cada ChangeNotifierProvider é um componente do provider ele escuta as mudanças do viewmodel,
// notifica os widgets que usam aquele viewModel para reconstruirem.

// create: (_) => ...
// Essa parte indica como criar a instância do ViewModel.
// Ela é chamada apenas uma vez, quando o widget é inserido na árvore.

// cria uma instância do StockDataSources, passando o dio (cliente HTTP).
// e depois, usa essa datasource para criar o StocksViewModel.

// .. cascade operator, após que o viewModel for construído,
// imediatamente chama o fetchStocks()

void main() {
  final dio = DioClient().dio;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StocksViewModel(StockDatasource(dio))..fetchStocks(),
        ),
        ChangeNotifierProvider(
          create: (_) => FundsViewModel(FundsDatasource(dio))..fetchFunds(),
        ),
        ChangeNotifierProvider(
          create:
              (_) =>
                  PrivatePensionsViewModel(PrivatePensionsDatasource(dio))
                    ..fetchPensions(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kinvo Mobile Test',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.mainBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeView(),
        '/national_stocks': (context) => NationalStocksView(),
        '/investiments_funds': (context) => InvestimentFundsView(),
        '/private_pension': (context) => PrivatePensionView(),
      },
    );
  }
}
