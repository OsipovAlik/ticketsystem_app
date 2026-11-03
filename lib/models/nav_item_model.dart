class NavitemModel {
  final String title;
  final String src;

  NavitemModel({required this.title, required this.src});
}


/// navigation bottom page model ///

List<NavitemModel> bottomNavItems = [
  NavitemModel(
    title: 'home',
    src: "lib/assets/svg/home.svg",
  ),
  NavitemModel(
    title: 'tickets', 
    src: "lib/assets/svg/ticket.svg"
    ),
  NavitemModel(
    title: 'favorites',
    src: "lib/assets/svg/favorite.svg",
  ),
   NavitemModel(
    title: 'search',
    src: "lib/assets/svg/search.svg",
  )
];


