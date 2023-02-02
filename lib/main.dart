
  import 'dart:io';

import'package:firas/layout/todo_app/todo_layout.dart';
import 'package:firas/modules/login/login_screen.dart';
import 'package:firas/shared/bloc_observer.dart';
import 'package:firas/shared/cubit/cubit.dart';
import 'package:firas/shared/cubit/states.dart';
import 'package:firas/shared/network/lacal/cache_helper.dart';
import 'package:firas/shared/network/remots/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';



import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/todo_layout.dart';
import 'modules/login/test.dart';
import 'modules/user_screen/User_Screen.dart';

import 'modules/bmi/bmi_screen.dart';

import 'modules/counter/counter_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark!));



  // Use cubits...
}

class MyApp extends StatelessWidget
{
   final bool isDark;
  MyApp(this.isDark);

  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create:(context) => NewsCubit()..getBusness()..getSports()..getScience(), ),
        BlocProvider(create: (BuildContext context) =>AppCubit()..changeAppMode(
            fromShared: isDark
        ) ,)

      ],
      child: BlocConsumer<AppCubit,AppStates>(
       listener:(context,state)
        {},
        builder:(context,state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            primarySwatch:  Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,

            appBarTheme:  AppBarTheme(
              titleSpacing: 20.0,
              backgroundColor: Colors.white,
              elevation: 0.0,
              backwardsCompatibility: false,
              systemOverlayStyle:SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,

              ),
              titleTextStyle: TextStyle(
                color: Colors.white ,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                  color: Colors.black
              ),

            ),


            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              backgroundColor:Colors.white,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange,
            ),

          ),
          darkTheme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
              ),
            ),
            primarySwatch:  Colors.deepOrange,
            appBarTheme:  AppBarTheme(
              titleSpacing: 20.0,
              backgroundColor:HexColor('#3A3B3C'),
              elevation: 0.0,
              backwardsCompatibility: false,
              systemOverlayStyle:SystemUiOverlayStyle(
                statusBarColor:HexColor('#3A3B3C'),

                statusBarIconBrightness: Brightness.light,

              ),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                  color: Colors.white
              ),

            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              backgroundColor: HexColor('#3A3B3C'),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange,
            ),

            scaffoldBackgroundColor: HexColor('#3A3B3C'),
          ),
          themeMode: AppCubit.get(context).isDark ?ThemeMode.dark :ThemeMode.light,
          home:NewsLayout(),


        ),

      ),
    );

  }
}

