import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit() : super(InitialState()){
    emit(WelcomeState());

  }

}