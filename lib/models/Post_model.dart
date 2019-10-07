



class Post{

  String id;
  String title;
  String  timeWritten;
  String content;

   int  voteUp;
   int voteDown;
   int userId;
   int  categoryId;
   String featuredImage;

   List<int> votersUp,votersDown;

  Post({this.id, this.title, this.timeWritten, this.content, this.voteUp,
    this.voteDown, this.userId, this.categoryId, this.featuredImage, this.votersUp,
    this.votersDown});


}