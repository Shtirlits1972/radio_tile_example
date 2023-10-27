import 'package:flutter_bloc/flutter_bloc.dart';

class Keeper {
  String selectedValue = 'unknown';
}

class DataCubit extends Cubit<Keeper> {
  String get getselectedvalue => state.selectedValue;

  setSelectedValue(String value) {
    state.selectedValue = value;
  }

  DataCubit(Keeper initState) : super(initState);
}
