import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/services/data_services.dart';

import '../model/PlacesModel.dart';

class AppCubits extends Cubit<CubitStates> {
  //once the initialiState has been down and emit another state
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  void detailPage(PlacesModel place) {
    emit(DetailState(place));
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
