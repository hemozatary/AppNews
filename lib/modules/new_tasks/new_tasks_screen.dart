   import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firas/shared/components/components.dart';
import 'package:firas/shared/components/constants.dart';
import 'package:firas/shared/cubit/cubit.dart';
import 'package:firas/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget
{



     @override
     Widget build(BuildContext context)
     {
       return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
         builder: (context,state)
        {
          return tasksBuilder(
            tasks: AppCubit.get(context).newtasks,
          );


         },
       );
     }
   }
