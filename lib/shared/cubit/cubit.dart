import 'package:firas/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:firas/modules/done_tasks/done_tasks_screen.dart';
import 'package:firas/modules/new_tasks/new_tasks_screen.dart';
import 'package:firas/shared/cubit/states.dart';
import 'package:firas/shared/network/lacal/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit( ) : super ( AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context) ;


  int currenIndex = 0;

  List<Widget> Screens =  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen()
  ];
  List<String> Titles = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];
  void changeIndex (int index)
  {
    currenIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  late Database database  ;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];

  void creatdatabase ()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database,version)
      {
        print('database created');
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT,  time TEXT, status TEXT)').then((value)
        {
          print('database created');
        }).catchError((error)
        {
          print('error in create table ${error.toString()} ');
        });
      },
      onOpen: (database)
      {
        getDataFormDatabase(database) ;
        print('database opned');


      },

     );
  }

  insertdatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
     await database.transaction((txn)async
    {
      txn.rawInsert('INSERT INTO tasks(title,time,status)VALUES("${title}","${time}","NEW")').then((value) {
        print('inserted successfully');
        emit(AppInsertDatabaseState());
      }).catchError((erorr){
        print('erorr in insert table(tasks)${erorr.toString()}');
      });
      return null;
    } );
  }

  void getData({
  required String status ,
  required int id ,
})
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ?,  WHERE id = ?',
        ['$status', id, ]);
    getDataFormDatabase(database);
    emit(AppUpdateDatabaseState());
  }


  void deleteData({ required int id ,})
{
database.rawUpdate(
'DELETE FROM tasks    WHERE id = ?',
[id ]);
getDataFormDatabase(database);
emit(AppDeleteDatabaseState());
}

void getDataFormDatabase(database)
  {
    newtasks = [];
    donetasks = [];
    archivetasks = [];

    emit(AppGetDatabaseLoadingState());
   database.rawQuery('SELECT * FROM "tasks"').then((value)
   {
     database = value ;
     newtasks.forEach((element) {
       if(element['statuse']=='new')
         newtasks.add(element);
       else
         if(element['statuse'] == 'done' )

         donetasks.add(element);
         else
        archivetasks.add(element);
     });
     emit(AppCreateDatabaseState());
   });
  }
  bool isBottomSheet = false;
  IconData fabIcon = Icons.edit;
  void changeBottomShetState({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheet = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
  bool isDark = false;
  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null)
    {
      isDark =fromShared;
      emit(AppChangeModeState());
    }

    else
    {
      isDark = !isDark ;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeState());
      });

    }

  }

}