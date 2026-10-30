import 'package:flutter_praktikum_4/data/models/mahasiswa_model.dart';

abstract class MahasiswaLocalDataSource {
  List<MahasiswaModel> getAllMahasiswa();
  void addMahasiswa(MahasiswaModel mahasiswa);
  void updateMahasiswa(String nim, MahasiswaModel updatedMahasiswa);
  void deleteMahasiswa(String nim);
}

class MahasiswaLocalDataSourceImpl implements MahasiswaLocalDataSource {
  final List<MahasiswaModel> _mahasiswaList = [];

  @override
  List<MahasiswaModel> getAllMahasiswa() {
    return _mahasiswaList;
  }

  @override
  void addMahasiswa(MahasiswaModel mahasiswa) {
    _mahasiswaList.add(mahasiswa);
  }

  @override
  void updateMahasiswa(String nim, MahasiswaModel updatedMahasiswa) {
    final index = _mahasiswaList.indexWhere((m) => m.nim == nim);
    if (index != -1) {
      _mahasiswaList[index] = updatedMahasiswa;
    }
  }

  @override
  void deleteMahasiswa(String nim) {
    _mahasiswaList.removeWhere((m) => m.nim == nim);
  }
}
