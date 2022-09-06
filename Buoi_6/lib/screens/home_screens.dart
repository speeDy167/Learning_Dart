import 'package:buoi6/screens/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/reuse_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = "";
  String _bookAmount = "";
  String? gender, noteName;
  String result = "Chưa có dữ liệu";
  bool _isSelected = false;
  bool _isClear = false;
  final _nameController = TextEditingController();
  final _bookController = TextEditingController();
  FocusNode _nameFocus = FocusNode();
  var customers = 0;
  var vipMembers = 0;
  var money = 0;
  var temp = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Hóa đơn",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Thông tin khách hàng",
                      style:const TextStyle(
                        fontSize: 25,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        activeColor: Colors.deepOrange,
                        value: "Anh",
                        groupValue: gender,
                        onChanged: ((value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                      ),
                      Text(
                        "Anh",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Radio(
                        activeColor: Colors.deepOrange,
                        value: "Chị",
                        groupValue: gender,
                        onChanged: ((value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                      ),
                      Text(
                        "Chị",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 100,
                        child: TextFormField(
                          focusNode: _nameFocus,
                          autofocus: false,
                          controller: _nameController,
                          decoration: textInputDecoration.copyWith(
                            labelText: //noteName == null ? "${noteName!}" :
                            "Họ và Tên",
                          ),
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          onChanged: ((value) {
                            setState(() {
                              _name = value;
                            });
                          }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vui lòng nhập họ và tên";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 200,
                        height: 100,
                        child: TextFormField(
                          autofocus: false,
                          controller: _bookController,
                          decoration: textInputDecoration.copyWith(
                            labelText: "Số lượng sách",
                          ),
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: ((value) {
                            setState(() {
                              _bookAmount = value;
                            });
                          }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vui lòng nhập số lượng sách";
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  LinkedLabelCheckbox(
                      label: "VIP member",
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      value: _isSelected,
                      onChanged: (bool value) {
                        setState(() {
                          _isSelected = value;
                        });
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tạm tính (${_bookAmount} sản phẩm): ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        NumberFormat.simpleCurrency(locale: "vi").format(temp),
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            setState(() {
                              if (_isSelected) {
                                result =
                                    (int.parse(_bookAmount) * 2000).toString();
                                vipMembers++;
                              } else {
                                result =
                                    (int.parse(_bookAmount) * 20000).toString();
                              }
                              money += (int.parse(result));
                              temp = money;
                            });
                            customers++;
                          }
                        },
                        child: Text("Đặt hàng"),
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            money = customers = vipMembers = temp = 0;
                            _isSelected = false;
                            gender = null;
                            _nameController.clear();
                            _bookController.clear();
                          });
                          _nameFocus.requestFocus();
                        },
                        child: Text("Tiếp tục mua hàng"),
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        onPressed: () {
                          savaData(_nameController.text);
                          nextScreen(context, ShowInfor(customer: customers, vipMember: vipMembers, money: money));
                        },
                        child: Text("Thống kê"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> savaData(noteData) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", noteData);
  }

  void getData() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    noteName = pref.getString("name");
  }
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _bookController.dispose();
    _nameFocus.dispose();
  }
}
