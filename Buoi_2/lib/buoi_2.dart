class Student {
  String? id;
  String? name;
  double? diemToan;
  double? diemVan;
  double? diemAnh;
  String? _dateOfBirth;
  String? _phoneNumber;

  Student(
      {required this.id,
      required this.name,
      required this.diemToan,
      required this.diemAnh,
      required this.diemVan});

  void setPhoneNumber({required String phoneNumber}) {
    this._phoneNumber = phoneNumber;
  }

  void setDateOfBirth({required String dateOfBirth}) {
    this._dateOfBirth = dateOfBirth;
  }

  String getStudentId() {
    return this.id!;
  }

  String getStudentName() {
    return this.name!;
  }

  double getDiemToan() {
    return this.diemToan!;
  }

  double getDiemVan() {
    return this.diemVan!;
  }

  double getDiemAnh() {
    return this.diemAnh!;
  }

  String getDateOfBirth() {
    return this._dateOfBirth!;
  }

  String getPhoneNumber() {
    return this._phoneNumber!;
  }

  double diemTrungBinh() {
    return (this.diemToan! + this.diemAnh! + this.diemVan!) / 3;
  }

  void xepLoai() {
    if (diemTrungBinh() <= 5)
      print('Yeu');
    else if (diemTrungBinh() > 5 && diemTrungBinh() < 7)
      print('Kha');
    else
      print('Gioi');
  }

  void printInformation() {
    print('Ma so Hoc sinh: ' + this.id.toString());
    print('Ten' + this.name.toString());
    print('Diem Anh: ' + this.diemAnh.toString());
    print('Diem Toan: ' + this.diemToan.toString());
    print('Diem Van: ' + this.diemVan.toString());
    print('Diem trung binh: ' + this.diemTrungBinh().toString());
    print('So dien thoai: ' + this._phoneNumber.toString());
    print('Ngay sinh: ' + this._dateOfBirth.toString());
    xepLoai();
  }
}
