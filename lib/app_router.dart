import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_tile_example/block.dart';
import 'package:radio_tile_example/forms/home_page.dart';
import 'package:radio_tile_example/forms/radio_page.dart';

class AppRouter {
  int selectIndex = 0;

  final DataCubit dataCubit = DataCubit(Keeper());

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: dataCubit,
            child: const HomePage(),
          ),
        );

      case '/RadioPage':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: dataCubit,
            child: const RadioPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: dataCubit,
            child: const HomePage(),
          ),
        );
    }
  }
}
