import 'package:flutter/material.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/model/story_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Anton"),
    Story("assets/images/user_2.jpeg", "Jazmin"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Anna"),
    Story("assets/images/user_2.jpeg", "Anton"),
    Story("assets/images/user_3.jpeg", "Misha"),
  ];

  List<Post> _post = [
    Post(
      username: "Annna",
      userImage: "assets/images/user_1.jpeg",
      postImage: "assets/images/user_2.jpeg",
      caption: "Consequater nihil aliquid omnis consequater",
    ),
    Post(
      username: "Annna",
      userImage: "assets/images/user_3.jpeg",
      postImage: "assets/images/feed_1.jpeg",
      caption: "Consequater nihil aliquid omnis consequater",
    ),
    Post(
      username: "Annna",
      userImage: "assets/images/feed_3.jpeg",
      postImage: "assets/images/user_3.jpeg",
      caption: "Consequater nihil aliquid omnis consequater",
    ),
    Post(
      username: "Annna",
      userImage: "assets/images/user_1.jpeg",
      postImage: "assets/images/user_2.jpeg",
      caption: "Consequater nihil aliquid omnis consequater",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // #stories watch all
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Stories",
                        style: TextStyle(color: Colors.grey, fontSize: 14),),
                      Text("Watch All",
                        style: TextStyle(color: Colors.grey, fontSize: 14),),
                    ],
                  ),
                ),
                // #storyList
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 110,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _itemOfStory(_stories[index]);
                      }

                  ),
                ),

                // #postList
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _post.length,
                    itemBuilder: (ctx, i) {
                      return _itemOfPost(_post[i]);
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                width: 3,
                color: Color(0xFFBe44ad),
              )
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name)
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // #header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.username),
                  ],
                ),
                IconButton(onPressed: () {},
                  icon: Icon(Icons.more_horiz),)
              ],
            ),
          ),
          FadeInImage(
            width: MediaQuery
                .of(context)
                .size
                .width,
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               children: [
                 IconButton(onPressed: () {},
                     icon: Icon(EvaIcons.heart)),
                 IconButton(onPressed: () {},
                     icon: Icon(EvaIcons.heartOutline)),
                 IconButton(onPressed: () {},
                     icon: Icon(EvaIcons.navigation)),
               ],
             ),


              IconButton(onPressed: () {},
                icon: Icon(EvaIcons.bookmark),
              )
            ],


          ),


          // #tags
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            margin: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // #caption
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            margin: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // #post date
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              "Febuary 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
