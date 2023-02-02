

import 'package:firas/layout/news_app/cubit/cubit.dart';
import 'package:firas/layout/news_app/cubit/states.dart';
import 'package:firas/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
 var searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state)
      {},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFromField(
                  controller:searchControl,
                  onChange: (value)
                  {
                   NewsCubit.get(context).getSearch(value);
                  },
                  type:TextInputType.text,
                  validator:(String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Search is not must empty';
                    }
                    return null;
                  },
                  prefix:Icons.search,
                  label: 'Search',
                ),

              ),

              Expanded(child: articleBuilder(list,context))

            ],
          ),
        );
      },

    );
  }
}
