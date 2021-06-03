class OnBoardingContent {

  String image;
  String title;
  String discription;

  OnBoardingContent({required this.image, required this.title, required this.discription});

}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: 'Quality Food',
      image: 'assets/onboard3.jpg',
      discription: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "
  ),
  OnBoardingContent(
      title: 'Fast Delevery',
      image: 'assets/onboard1.jpg',
      discription: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "
  ),
  OnBoardingContent(
      title: 'Reward surprises',
      image: 'assets/onboard4.jpg',
      discription: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "
  ),
];