import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_service.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData()async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }
    catch(e){
      
    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  gohome(){
    emit(LoadedState(places));
  }

}