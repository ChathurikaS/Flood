import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/city.dart';
import 'package:flutter_application_1/models/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = City.citiesList.where((city) => city.isDefault == false).toList();
    List<City> selectedCities = City.getSelectedCities();

    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myConstants.secondaryColour,
        title: Text('${selectedCities.length}selected'),
      ),
      body:  ListView.builder(
        itemCount: cities.length ,
        itemBuilder: (BuildContext context, int index){
           return Container(
            margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: size.height * .08,
            width: size.width,
            decoration: BoxDecoration(
              border: cities[index].isSelected == true ? Border.all(
                color: myConstants.secondaryColour.withOpacity(.6),
                 width: 2,
              ) : Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color:  myConstants.primaryColour.withOpacity(.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset:  const Offset(0, 3),
                )
              ]
            ),
            child: Row(
              children: [
                Image.asset(cities[index]. isSelected == true ? 'assets/checked.png': 'assets/unchecked.png')
              ],
            ),
           );
        },
      ),
    );
  }
}