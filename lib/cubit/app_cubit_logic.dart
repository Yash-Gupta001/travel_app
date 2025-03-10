import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
    @override
    _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: BlocBuilder<AppCubit, CubitStates>(
                builder: (context, state){
                    if(state is WelcomeState){
                        return WelcomePage();
                    }
                    else{
                        return Container();
                    }
                },
            ),
        );
    }
}