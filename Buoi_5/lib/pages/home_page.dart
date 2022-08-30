import 'package:buoi5/widgets/reuse_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController diemToanController = TextEditingController();
  TextEditingController diemVanController = TextEditingController();
  TextEditingController diemAnhController = TextEditingController();
  String diemTrungBinh = "Chưa có dữ liệu";
  String xepLoai = "Chưa có dữ liệu";
  double temp = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Phần mềm quản lí học sinh"),
          centerTitle: true,
          backgroundColor: Color(0XFFCB2B93),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0XFFCB2B93),
                  Color(0xFF9546C4),
                  Color(0xFF5E61F4),
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ReuseableTextfield('Nhập điểm Toán', diemToanController),
                const SizedBox(
                  height: 15,
                ),
                ReuseableTextfield('Nhập điểm Văn', diemVanController),
                const SizedBox(
                  height: 15,
                ),
                ReuseableTextfield('Nhập điểm Anh', diemAnhController),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    onPressed: () {
                      setState(() {
                        diemTrungBinh =
                            ((double.parse(diemToanController.text) +
                                        double.parse(diemVanController.text) +
                                        double.parse(diemAnhController.text)) /
                                    3)
                                .toString();
                        temp = double.parse(diemTrungBinh);
                      });
                    },
                    child: Text('Submit')),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: Row(
                    children: [
                      Text("Điểm trung bình: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(
                        diemTrungBinh,
                        style: TextStyle(color: Colors.yellow,fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: Row(
                    children: [
                      Text("Xếp loại: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(
                        rank(temp),
                        style: TextStyle(color: Colors.yellow, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String rank(double num) {
    if (num >= 5 && num < 9) {
      return "Giỏi";
    } else if (num >= 9) {
      return "Xuất sắc";
    }
    return "Yếu";
  }
}
