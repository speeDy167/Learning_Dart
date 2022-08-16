import 'dart:ffi';

import 'package:dart_application_1/dart_function_1.dart' as dart_application_1;

void main(List<String> arguments) {
  // Buoi_1().checkChanLe1(10);
  // Buoi_1().checkChanLe1(15);
  // Buoi_1().checkChanLe2(0);
  // Buoi_1().checkChanLe2(1);
  // print(Buoi_1().giaiThua(8).toString());
  // Buoi_1().soDuongNhoHon25();
    //  Buoi_1().tongChan();
    // Buoi_1().Bai1();
    Buoi_1().Bai4();
}



class Buoi_1{

  //Kiem tra chan le voi If...Else
  void checkChanLe1(int x){
  if( x % 2 == 0)
  print('${x} la so chan');
  else 
  print('${x} la so le');
}
//Kiem tra chan le voi Switch case
void checkChanLe2(int x){
  switch ( x % 2 ) {
    case 0:
      print('${x} la so chan');
      break;
    case 1:
      print('${x} la so le');
      break;
    default:
    break;
  }
}
//Tinh giai thua
int giaiThua(int x){
  int result = x;
  for(int i = 1; i < x; i++)
    result *= i;
  return result;
}
//So duong nho hon 25
void soDuongNhoHon25(){
  var list =[-11,-20,0,1,2,5,20,25,30];
  for(int number in list){
    if(number < 25 && number >= 0)
      print(number);
  }
}
//Tong tu 1 den 15 la so chan
void tongChan(){
  int sum = 0;
  for(int i = 1; i < 16; i++){
    sum += i;
    if(sum % 2 ==0)
      print('Chan: ${sum}'.toString());
  }
}
//Bai 0
void Bai0(){
  int sum = 0;
  for(int i = 1; i <= 10000; i++){
    sum += i;
    if(sum % 2 ==0 && sum <= 400)
      print('Chan: ${sum}'.toString());
  }
}
void Bai1(){
  int count1 = 0;
  int count2 = 0;
  for(int i = 1; i <= 10000; i++){
    if(i % 3 ==0)
      count1++;
    if(i % 5 ==0)
      count2++;
  }
  print(count1);
  print(count2);
}
void Bai3(){
  List list5 = [4, 3, 10, 9, 15, 7, 6, 5, 8];
  for(int i = 0; i < list5.length - 1; i++){
    for(int j = i + 1; j < list5.length; j++){
      if((i+j) % 3 == 0)
        print('So ${i} + ${j} chia het cho 3'.toString());
    }
  }
}


void Bai4(){
  Map <String, dynamic> classInformation = {
    "id" : "12",
    "name" : "Báo Flutter 1.2",
    "description" : "Lớp học lập trình Flutter, hot line: 0349582808",
  };
  List<String> temp = classInformation['description'].split(' ');
  print(temp.elementAt(7));
}

}
