import 'package:buoi_2/Bai2/person_sample.dart';

class Person extends PersonSample{
  String? id;
  String? name;
  int? _birthYear;
  Person({required this.id, required this.name});
  void setBirthYear(int birthYear){
    this._birthYear = birthYear;
  }
  int getBirthYear(){
    return this._birthYear!;
  }
  int getAge(){
    return DateTime.now().year - getBirthYear();
  }
  void getInfor(){
    print('Id: ' + this.id!.toString());
    print('Ten: ' + this.name!);
    print('Nam sinh: ' + getBirthYear().toString());
    print('Tuoi: ' + getAge().toString());
  }
}