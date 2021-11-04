class Breakfast{
  String id;
  String image;
  String image2;
  String title;
  String subtitle;

  Breakfast(this.id, this.image, this.image2, this.title, this.subtitle);
}

List<Breakfast> breakfastList = [

  Breakfast('1', 'assets/images/blue1.png',
      'assets/images/blue2.png', 'Blue Salad', 'A salad is a dish consisting of a mixture of small pieces of food, usually vegetables'),
  Breakfast('2', 'assets/images/blue1.png', 'assets/images/blue2.png',
      'Blue Salad', 'A salad is a dish consisting of a mixture of small pieces of food, usually vegetables'),

];
