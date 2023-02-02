   import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firas/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:firas/modules/done_tasks/done_tasks_screen.dart';
import 'package:firas/modules/new_tasks/new_tasks_screen.dart';
import 'package:firas/shared/components/components.dart';
import 'package:firas/shared/components/constants.dart';
import 'package:firas/shared/cubit/cubit.dart';
import 'package:firas/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget
{



  var titileController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var scaffuldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(


      create: (BuildContext context) => AppCubit()..creatdatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
       listener:(context,state){
         if(state is AppInsertDatabaseState)
         {
           Navigator.pop(context);

         }
       } ,
        builder: (context,state)
        {
          AppCubit cubit = AppCubit.get(context);
         return Scaffold(
            key: scaffuldKey,
            appBar: AppBar(
              title: Text(
                  cubit.Titles[cubit.currenIndex]
              ),
            ),
            body: ConditionalBuilder(
              condition:state is AppGetDatabaseLoadingState,
              builder: (context) =>cubit.Screens[cubit.currenIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(

              onPressed: ()
              {
                if(cubit.isBottomSheet)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertdatabase(title:titileController.text, time: timeController.text, date: dateController.text,);

                  }
                }else
                {
                  scaffuldKey.currentState?.showBottomSheet((context) =>
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFromField(
                                controller: titileController,
                                type: TextInputType.text,
                                validator: (String? value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return('title is not must empty');
                                  }
                                  return null;
                                },
                                prefix: Icons.title,
                                label: 'title task',
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFromField(
                                controller: timeController,

                                type: TextInputType.datetime,
                                onTap: ()
                                {
                                  showTimePicker(
                                    context: context,
                                    initialTime:TimeOfDay.now(), ).then((value)
                                  {
                                    timeController.text = value!.format(context).toString();
                                    print(value.format(context));
                                  });
                                },
                                validator: (String? value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return('time is not must empty');
                                  }
                                  return null;
                                },
                                prefix: Icons.watch_later_outlined,
                                label: 'time task',
                              ),
                              SizedBox(
                                height: 15.0,
                              ),


                            ],
                          ),
                        ),
                      ),
                    elevation:15.0,
                  ).closed.then((value) {
                   cubit.changeBottomShetState(isShow: false, icon:Icons.edit);

                  });
                  cubit.changeBottomShetState(isShow: true, icon:Icons.add);

                }


              },
              child: Icon(
                 cubit.fabIcon
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currenIndex,
              onTap: (index)
              {
                  cubit.changeIndex(index);

              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.menu

                  ),
                  label: 'Taskets',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.check_circle_outline

                  ),
                  label: 'Done',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.archive_outlined

                  ),
                  label: 'Archive',

                ),
              ],),
          );
        },
      ),
    );
  }
  // Future<String> getName() async
  // {
  //   return 'zatary';
  // }



}





