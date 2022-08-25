import 'package:buoi_3/buoi_3.dart' as buoi_3;

Future <void> main() async {

  // Try catch
  List <dynamic> ageList = [1,3,5, 8,4,20, 25, 26, -30 , 15.5, 40 , 65];
  check(ageList);
  
  //1.
  print(await createName());
  print(await createAge());
  print(await createHomeTown());

  //2.
  Stream<int> exercise2 = makeNumberStream(maxNumber: 100);
  readStream(exercise2);
}

//Try catch
void check(List<dynamic> a) {
  for (int i = 0; i < a.length; i++) {
    try {
      if (!isInteger(a[i]) || a[i] < 0) {
        print('Value: ${a[i]}'.toString() + ' Pos: ${i}'.toString());
        throw Exception(
            'This is not age, type: ' + a[i].runtimeType.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

bool isInteger(num value) => (value % 1) == 0;

//Exercise 1
Future<String> createName() => Future.delayed(
      Duration(seconds: 3),
      () => 'Trong Phuc',
);
Future<String> createAge() => Future.delayed(
  Duration(seconds: 5),
  () => '19',
);
Future<String> createHomeTown() => Future.delayed(
  Duration(seconds: 2),
  () => 'Ho Chi Minh city',
);

//Exercise 2
Stream<int> makeNumberStream({required int maxNumber}) async* {
  for (int i = 1; i <= maxNumber; i++) {
    await Future.delayed(Duration(seconds: 3));
    yield i;
  }
}


void readStream(Stream<int> numberStream) async {
  await for (int number in numberStream) {
    if (number % 3 == 0) {
      print(number);
    }
  }
}

