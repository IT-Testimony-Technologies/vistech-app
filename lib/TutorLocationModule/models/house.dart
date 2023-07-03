import 'agent.dart';

class House {
  final String name,
      image,
      location,
      price,
      bedrooms,
      bathrooms,
      floors,
      area,
      description;
  final Agent agent;
  House(this.name, this.image, this.location, this.price, this.bedrooms,
      this.bathrooms, this.floors, this.area, this.description, this.agent);

  static List<House> houseList() {
    List<House> list = [];
    list.add(House(
        'Bluish Homie',
        'https://userphotos2.teacheron.com/951071-73182.jpg',
        '2715, Bell Street, San Jose',
        '\$1800/month',
        '5 stars',
        'Available',
        'Online',
        'Online',
        'He is a highly experienced music tutor, offering lessons in violin. They are located in the heart of San Jose and provide high-quality and personalized instruction to students of all levels...',
        Agent.getOne()));

    list.add(House(
        'Tyson Fury',
        'https://5.imimg.com/data5/RY/PI/MY-4279490/home-tuition-singing-classes-semi-classical-in-devli-road-2c-khanpur-500x500.jpg',
        '2715, Bell Street, San Jose',
        '\$1800/month',
        '5 stars',
        'Available',
        'Online',
        'Online',
        'Tyson Fury is a highly experienced music tutor, offering lessons in flute. They are located in the heart of San Jose and provide high-quality and personalized instruction to students of all levels...',
        Agent.getOne()));

    list.add(House(
        'Future',
        'https://i.ytimg.com/vi/KsAdTFwgDmU/maxresdefault.jpg',
        '2715, Bell Street, San Jose',
        '\$1800/month',
        '5 stars',
        'Available',
        'Online',
        'Remote',
        'Future is a highly experienced music tutor, offering lessons in Drums. They are located in the heart of San Jose and provide high-quality and personalized instruction to students of all levels...',
        Agent.getOne()));

    list.add(House(
        'Bluish',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdk6fhdulkF0jxfhZOMG4nX_FooEZzKfJJaf6alocsCaNomgBd5jHFqBN9GGNJChe2S20&usqp=CAU',
        '2715, Bell Street, San Jose',
        '\$1800/month',
        '5 stars',
        'Available',
        'Online',
        'Remote',
        'Bluish is a highly experienced music tutor, offering lessons in Flute. They are located in the heart of San Jose and provide high-quality and personalized instruction to students of all levels...',
        Agent.getOne()));

    return list;
  }

  static House getOne() {
    return House(
        'Homie',
        'https://userphotos2.teacheron.com/328850-67583.jpeg',
        '2715, Bell Street, San Jose',
        '\$1800/month',
        '5 stars',
        'Available',
        'Online',
        'Remote',
        'Homie is a highly experienced music tutor, offering lessons in drums. They are located in the heart of San Jose and provide high-quality and personalized instruction to students of all levels...',
        Agent.getOne());
  }
}
