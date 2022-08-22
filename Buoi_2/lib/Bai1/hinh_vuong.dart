import 'package:buoi_2/Bai1/hinh_chu_nhat.dart';

import 'hinh_chu_nhat.dart';

class HinhVuong extends HinhChuNhat {
  HinhVuong({required double canh}) : super(chieuDai: canh, chieuRong: canh);
  
  double tinhChuVi() {
    return this.chieuDai! * 4;
  }
  
  void getInfor() {
      print('Canh: ' + this.chieuDai.toString());
      print('Chu vi: ' + tinhChuVi().toString());
      print('Dien tich: ' + this.tinhDienTich().toString());
  }
  
}
