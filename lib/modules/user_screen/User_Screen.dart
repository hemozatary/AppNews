import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';

class UsersScreen extends StatelessWidget
{

  List<UserModel> Users = [
    UserModel(id: 1,
        name: 'ebrahem',
        phone: '16543432382'
    ),
    UserModel(id: 2,
        name: 'zatary',
        phone: '2563282682'
    ),
    UserModel(id: 3,
        name: 'akoos',
        phone: '256328545282'
    ),
    UserModel(id: 2,
        name: 'mohamed',
        phone: '25632822456'
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),

      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(Users[index]),

          separatorBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,

                ),
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
          itemCount: Users.length),
    );
  }


  Widget buildUserItem(UserModel User) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Text(
                '${User.id}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  '${User.name}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${User.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}