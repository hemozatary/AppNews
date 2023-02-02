  import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firas/modules/web_view/web_view_screen.dart';
import 'package:firas/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget defaultButton (
  {
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpparCase = true,
  double radios = 0.0,
  required String text,
  required  function
  }) =>

  Container(
    child: MaterialButton(


      onPressed: function,

      child: Text(
       isUpparCase? text.toUpperCase() : text,
        style: TextStyle(
          color: Colors.white,

        ),

      ),

    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: background,
    ),
    width: width,
    height: 40.0 ,


  );


  Widget defaultFromField ({
    required TextEditingController controller,
    required TextInputType type,
     onSubmit,
    onChange ,
    bool isClickable = true ,

    bool isPassword = false,
    required validator,
    required IconData prefix,
     suffix,
    required String label,
        suffixpressed,
    onTap,


  })
  => TextFormField(
    controller:controller ,
   onFieldSubmitted: onSubmit,
    obscureText: isPassword,
    onTap:onTap  ,

    onChanged:onChange,
  validator: validator,
    keyboardType: type,
    enabled:isClickable,

    decoration: InputDecoration(
      labelText: label,

      prefixIcon: Icon(
        prefix
      ),
      suffixIcon: suffix != null ? IconButton(
        onPressed:suffixpressed ,
        icon: Icon(
         suffix
        ),
      ) : null,
      border: OutlineInputBorder(),
    ),

  );

  Widget buildTaskItem(Map model, context ) => Dismissible(
    key: Key(model['id'].toString()),
    onDismissed: (direction)
    {
     AppCubit.get(context).deleteData(id: model['id']);  },
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(

    children: [
    CircleAvatar(
    radius: 40.0,
    child: Text('${model['time']}'),
    ),
    SizedBox(
    width: 15.0,
    ),
    Expanded(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      '${model['title']}',
      style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      ),
      ),
      Text(
      '${model['date']}',
      style: TextStyle(
      color: Colors.grey,
      ),
      ),

      ],
      ),

    ),
      SizedBox(
        width: 15.0,
      ),
      IconButton(
          onPressed: ()
          {
            AppCubit.get(context).getData(

                status: 'done',
                id: model['id']);
          },
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          )),
      SizedBox(
        width: 15.0,
      ),
      IconButton(
          onPressed: ()
          {
            AppCubit.get(context).getData(

                status: 'archive',
                id: model['id']);
          },
          icon: Icon(
            Icons.archive,
            color: Colors.black12,
          )),
    ],
    ),
    ),
  );


  Widget  tasksBuilder ({
    required List<Map> tasks ,
  }) => ConditionalBuilder(
    condition: tasks.length > 0,
    builder:(context) => ListView.separated(
        itemBuilder: (context,index) => buildTaskItem(AppCubit.get(context).newtasks[index],context),
        separatorBuilder:(context,index) => separatorBuilder(),
        itemCount:AppCubit.get(context).newtasks.length) ,
    fallback:  (context) => Container(
      color: Colors.grey,

      child: Column(
        children: [
          Icon(
            Icons.menu,
            size: 20.0,

          ),
          Text(
            'i love feras ',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey
            ),
          ),
        ],
      ),
    ),

  );

  Widget separatorBuilder() =>  Container(
    width: double.infinity,
    height: 0.1,
    color: Colors.grey,
  );
  Widget buildArticleItem(article,context) =>  InkWell(
    onTap: ()
    {
      navigateTo(context, WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(

        children:[
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image:DecorationImage(
                  image:NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover
              ),

            ),

          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,

                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    ),
  );

  Widget articleBuilder (list,context) => ConditionalBuilder(

    condition: list.length > 0 ,
    builder:(context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index) => buildArticleItem(list[index],context),
      separatorBuilder:(context,index) => separatorBuilder(),
      itemCount:10,
    ),
    fallback: (context) => const Center(child: CircularProgressIndicator()),
  );

  void navigateTo(context,widget) =>  Navigator.push(
    context   ,
    MaterialPageRoute(
      builder: (context) => widget ,

    ),
  );





