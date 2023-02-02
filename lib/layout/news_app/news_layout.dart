import 'package:bloc/bloc.dart';
import 'package:firas/layout/news_app/cubit/cubit.dart';
import 'package:firas/layout/news_app/cubit/states.dart';
import 'package:firas/shared/components/components.dart';
import 'package:firas/shared/network/remots/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/search/search_screen.dart';
import '../../shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state)
      {
        var cubit = NewsCubit.get(context);
       return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App '
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                      Icons.search,
                  ),
              ),
              IconButton(
                  onPressed: ()
                  {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                      Icons.brightness_4_outlined,
                  ),
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
             cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
            items:cubit.bottomItem ,
          ),

       );
      }

    );

  }
}
