import 'dart:math';
import 'dart:io';

class Dog{
  String name;
  int age;

  void showOutput(){
    print(name);
    print(age);
  }
}

void main(){
  Dog person1 = Dog();
  person1.name = 'Mehul';
  person1.age = 12;
  person1.showOutput();

}