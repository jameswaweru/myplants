class Photo {
  String url;
  String userName;
  String userUnsplashAccount;

  Photo(this.url , this.userName, this.userUnsplashAccount);

  static List<Photo> generateTreePhotos() {
    return [
      Photo("https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG","jim","aple one"),
      Photo("https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG","jim 2","apple two"),
      Photo("https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG","jim 3","apple three"),
      Photo("https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG","jim 4","apple four"),
    ];
  }

}