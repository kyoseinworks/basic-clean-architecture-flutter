import '../models/mahasiswa_model.dart';

abstract class MahasiswaDataSource {
  Future<List<MahasiswaModel>> getAllMahasiswa();
  Future<void> addMahasiswa(MahasiswaModel mahasiswa);
  Future<void> updateMahasiswa(String nim, MahasiswaModel mahasiswa);
  Future<void> deleteMahasiswa(String nim);
}
