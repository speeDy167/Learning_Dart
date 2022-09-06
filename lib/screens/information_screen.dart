import 'dart:ffi';

import 'package:buoi6/widgets/reuse_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowInfor extends StatefulWidget {
  final customer, vipMember, money;
  const ShowInfor({Key? key,
  required this.customer,
  required this.vipMember,
  required this.money,
  }) : super(key: key);
  @override
  State<ShowInfor> createState() => _ShowInforState();
}

class _ShowInforState extends State<ShowInfor> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text("Thông tin thống kê", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tổng số KH: ", style: const TextStyle(fontSize: 18,color: Colors.black),),
                  Text("${this.widget.customer}", style: const TextStyle(fontSize: 18,color: Colors.red),)
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tổng số KH là VIP: ", style: const TextStyle(fontSize: 18,color: Colors.black),),
                  Text("${this.widget.vipMember}", style: const TextStyle(fontSize: 18,color: Colors.red),)
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tổng doanh thu: ", style: const TextStyle(fontSize: 18,color: Colors.black),),
                  Text(NumberFormat.simpleCurrency(locale: "vi").format(this.widget.money), style: const TextStyle(fontSize: 18,color: Colors.red),)
                ],
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  popUpDialog(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/logout_icon.png"),
                    fit: BoxFit.cover
                    )
                  ),
                ),
              )
            ],
          ),
          )
        ),
      ),
    );
  }

  
}