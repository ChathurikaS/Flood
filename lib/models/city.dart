class City{
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;

  City({required this.isSelected, required this.city, required this.country, required this.isDefault});

  //list of the city data 
   static List<City> citiesList = [
    City(
        isSelected: false,
        city: 'Anuradhapura',
        country: 'Sri Lanka',
        isDefault: true),
    City(
        isSelected: false,
        city: 'Badulla',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Batticaloa',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Colombo',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Galle',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Gampaha',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Hambantota',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Jaffna',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Kandy',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Kurunegala',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Matara',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Maharagama',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Moratuwa',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Mount Lavinia',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Negombo',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Nuwara Eliya',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Polonnaruwa',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Ratnapura',
        country: 'Sri Lanka',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Trincomalee',
        country: 'Sri Lanka',
        isDefault: false),
  ];

  //Get the selected cities
  static List<City> getSelectedCities(){
    List<City> selectedCities = City.citiesList;
    return selectedCities
        .where((city) => city.isSelected == true)
        .toList();
  }
}