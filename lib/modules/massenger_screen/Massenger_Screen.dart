import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://pixabay.com/photos/tree-sunset-clouds-sky-silhouette-736885/'
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Icon(

                Icons.camera_alt,
                size: 16.0,

              ),
            ),
          ),
          IconButton(
            onPressed: () {

            },
            icon: CircleAvatar(

              radius: 20.0,
              backgroundColor: Colors.blue,

              child: Icon(


                Icons.edit,
                size: 16.0,


              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[300],
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0)
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(

                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,

                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, index) =>
                      buildStoryItem(),
                  separatorBuilder: (context, index) =>
                      SizedBox(
                        height: 20.0,
                      ),
                  itemCount: 15,


                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) =>
                    SizedBox(
                      height: 20.0,
                    ),
                itemCount: 15,
              ),


            ],
          ),
        ),
      ),

    );
  }


  Widget buildChatItem() =>
      Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 2.0,
                  bottom: 2.0,
                ),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://pixabay.com/photos/tree-sunset-clouds-sky-silhouette-736885/'

                  ),
                ),
              ),
              CircleAvatar(
                radius: 11.0,
                backgroundColor: Colors.white,

              ),

              CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Ebrahem zatary akasia al saeed',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      'hello baby i love you very match',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 5.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),


                      ),
                    ),
                    Text(
                      '20:01 PM',
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      );

  Widget buildStoryItem() =>
      Container(
        width: 60.0,

        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 2.0,
                    bottom: 2.0,
                  ),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://pixabay.com/photos/tree-sunset-clouds-sky-silhouette-736885/'

                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 11.0,
                  backgroundColor: Colors.white,

                ),

                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            Text(
              'ebrahem zatary mohamed',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

          ],
        ),
      );
}
