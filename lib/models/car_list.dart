
import 'package:car_rental/models/car_model.dart';
import 'package:flutter/material.dart';

class CarProvider extends ChangeNotifier {
  List<CarModel> cars = [
    CarModel(
        name: "Nemesis",
        price: 150,
        rate: 4.5,
        hp: 200,
        topSpeed: 178,
        sec: 1.2,
        passengers: 2,
        image: "assets/images/Nemesis.png",
        doors: 4),
    CarModel(
        name: "Olympus",
        price: 125,
        rate: 4.4,
        hp: 240,
        topSpeed: 199,
        sec: 2.5,
        passengers: 4,
        image: "assets/images/Olympus.png",
        doors: 4),
    CarModel(
        name: "Rebel",
        price: 455,
        rate: 4.8,
        hp: 300,
        topSpeed: 200,
        sec: 1.2,
        passengers: 2,
        image: "assets/images/Rebel.png",
        doors: 4),
    CarModel(
        name: "Spartacus",
        price: 250,
        rate: 3.6,
        hp: 350,
        topSpeed: 299,
        sec: 1.2,
        passengers: 5,
        image: "assets/images/Spartacus.png",
        doors: 4),
    CarModel(
        name: "Viper",
        price: 320,
        rate: 2.4,
        hp: 600,
        topSpeed: 320,
        sec: 1.2,
        passengers: 2,
        image: "assets/images/Viper.png",
        doors: 4),
    CarModel(
        name: "Spartan Blah",
        price: 180,
        rate: 4.5,
        hp: 350,
        topSpeed: 350,
        sec: 1.2,
        passengers: 2,
        image: "assets/images/Spartan.png",
        doors: 4),
  ];

  //get list
  List<CarModel> get Cars => cars;

  //get one
  List<CarModel> cart = [];

  //add
  void addCarToCart(CarModel car) {
    cart.add(car);
    notifyListeners();
  }

  //remove
  void removeCarFromCart(CarModel car) {
    cart.remove(car);
    notifyListeners();
  }

  //remove all
  void removeAllCarFromCart(List<CarModel> cars) {
    cart.clear();
    notifyListeners();
  }

  //total price
  double totalPrice(List<CarModel> cart) {
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].price;
    }
    return total;
  }
}
