class HinhChuNhat {
  double? chieuDai;
  double? chieuRong;
  HinhChuNhat({required this.chieuDai, required this.chieuRong});

  double tinhDienTich() {
    return this.chieuDai! * this.chieuRong!;
  }

  double tinhChuVi() {
    return (this.chieuRong! + this.chieuDai!) * 2;
  }
  void getInfor(){
    print('Chieu dai: ' + chieuDai.toString());
    print('Chieu rong: ' + chieuRong.toString());
    print('Chu vi: ' + tinhChuVi().toString());
    print('Dien tich: ' + this.tinhDienTich().toString());
  }
}
