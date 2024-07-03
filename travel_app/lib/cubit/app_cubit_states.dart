import 'package:equatable/equatable.dart';

import '../model/PlacesModel.dart';

abstract class CubitStates extends Equatable {}

//every cubit app will have one initial state,
// when we first create cubit, we should pass a state function
class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => []; //contains data should be changed
}

//once initialization has been down , the next will be responsible for showing welcome page
class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<PlacesModel> places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.place);
  final PlacesModel place;
  @override
  // TODO: implement props
  List<Object?> get props => [place];
}
