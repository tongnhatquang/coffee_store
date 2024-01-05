// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_store/coffee_properties/coffee_title.dart';
import 'package:coffee_store/coffee_properties/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //list of coffee
  final List coffeeTypes = [
    //[coffee type , isSelected]
    ['Cappucino',true],
    ['Latte',false],
    ['Expresso',false],
    ['Tea',false],
  ];
  //user tapped on coffee selected
  void coffeeTypeSelected(int index){
    setState(() {
      //the loop make every selection false
      for(int i = 0; i < coffeeTypes.length; i++){
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body: Column(children: [
        //Find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffee for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 55,
            )
          ),
        ),
        SizedBox(height: 50),
        //Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your coffee',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        //horizontal listview of coffee types
        Container(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: (context,index){
            return CoffeeType(
                coffeeType: coffeeTypes[index][0],
                isSelected: coffeeTypes[index][1],
                onTap: (){
                  coffeeTypeSelected(index);
                },
            );
          })
        ),
        //horizontal listview of coffee titles
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTitle(
                coffeeImagePath: 'lib/images/latte_2.png',
                coffeeName: 'Latte',
                coffeePrice: '4.20',
              ),
              CoffeeTitle(
                coffeeImagePath: 'lib/images/cappucino_2.png',
                coffeeName: 'Cappucino',
                coffeePrice: '4.50',
              ),
              CoffeeTitle(
                coffeeImagePath: 'lib/images/expresso.png',
                coffeeName: 'Expresso',
                coffeePrice: '5.10',
              ),
              CoffeeTitle(
                coffeeImagePath: 'lib/images/tea_3.png',
                coffeeName: 'Tea',
                coffeePrice: '4.30',
              ),
            ],
          ),
        ),
      ],)
    );
  }
}