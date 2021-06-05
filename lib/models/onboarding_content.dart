class OnBoardingContent {

  String image;
  String title;
  String discription;

  OnBoardingContent({required this.image, required this.title, required this.discription});

}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: 'Plant Trees',
      image: 'assets/onboard3.jpg',
      discription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut suscipit enim elit, vel congue mi hendrerit in."
          " Suspendisse convallis, lorem sit amet auctor tincidunt, arcu ante elementum diam, at ultricies mauris risus sed "
          "nibh. Morbi in imperdiet libero. Vestibulum vel turpis ut augue hendrerit ultricies."
  ),
  OnBoardingContent(
      title: 'Free Updates',
      image: 'assets/onboard1.jpg',
      discription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut suscipit enim elit, vel congue mi hendrerit in."
          " Suspendisse convallis, lorem sit amet auctor tincidunt, arcu ante elementum diam, at ultricies mauris risus sed "
          "nibh. Morbi in imperdiet libero. Vestibulum vel turpis ut augue hendrerit ultricies."
  ),
  OnBoardingContent(
      title: 'Easy Tracking',
      image: 'assets/onboard4.jpg',
      discription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut suscipit enim elit, vel congue mi hendrerit in."
          " Suspendisse convallis, lorem sit amet auctor tincidunt, arcu ante elementum diam, at ultricies mauris risus sed "
          "nibh. Morbi in imperdiet libero. Vestibulum vel turpis ut augue hendrerit ultricies."
  ),
];