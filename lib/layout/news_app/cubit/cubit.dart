import 'package:bloc/bloc.dart';
import 'package:firas/layout/news_app/cubit/states.dart';
import 'package:firas/modules/business/business_screen.dart';
import 'package:firas/modules/science/science_screen.dart';
import 'package:firas/modules/settings_screen/settings_screen.dart';
import 'package:firas/modules/sports/sport_screen.dart';
import 'package:firas/shared/network/remots/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super (NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem =
  [
    BottomNavigationBarItem(
      icon:Icon(
        Icons.business
      ),
      label: 'Business',


    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.sports
      ),
      label: 'Sport',


    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.science
      ),
      label: 'Science',


    ),


  ];

  List<Widget> Screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),

  ];


  void changeBottomNavBar (int index)
  {
    currentIndex = index;
    if(index == 1)
        getSports();
      else
      getScience();

    emit(NewsBottomNavState());
  }

  List<dynamic> Busness = [];

  void getBusness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'Business',
          'from':'2023-01-30',
          'to':'2023-01-30',
          'sortBy':'popularity',
          'apiKey':'78dbdd8f027b497788bc5235d481872f',

        }
    ).then((value)
    {
      Busness=value.data['articles'];
      print(Busness.length);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    })
    ;
  }

  List<dynamic> Sports = [];

  void getSports()
  {
    if(Sports.length == 0)
      {
        DioHelper.getData(
            url: 'v2/everything',
            query: {
              'q':'sports',
              'from':'2023-01-30',
              'to':'2023-01-30',
              'sortBy':'popularity',
              'apiKey':'78dbdd8f027b497788bc5235d481872f',

            }
        ).then((value)
        {
          Sports=value.data['articles'];
          print(Sports.length);
          emit(NewsGetSportsSuccessState());
        }).catchError((error)
        {
          emit(NewsGetSportsErrorState(error.toString()));
        })
        ;
      }else {
      emit(NewsGetBusinessLoadingState());
    }

  }

  List<dynamic> Science = [];

  void getScience()
  {
    if(Science.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q': 'science',
            'from': '2023-01-30',
            'to': '2023-01-30',
            'sortBy': 'popularity',
            'apiKey': '78dbdd8f027b497788bc5235d481872f',

          }
      ).then((value) {
        Science = value.data['articles'];
        print(Science.length);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      })
      ;
    }else
    {
      emit(NewsGetScienceLoadingState());
    }
  }

  List<dynamic> Search = [];

  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());
    Search == [];


//https://newsapi.org/v2/everything?q=tesla&apiKey=78dbdd8f027b497788bc5235d481872f
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q': '$value',
            'apiKey': '78dbdd8f027b497788bc5235d481872f',

          }
      ).then((value) {
        Search = value.data['articles'];
        print(Search.length);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });


  }
}