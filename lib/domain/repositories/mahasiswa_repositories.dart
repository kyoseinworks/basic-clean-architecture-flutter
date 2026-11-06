import '../entities/mahasiswa.dart';

abstract class MahasiswaRepository {
  Future<List<Mahasiswa>> getAllMahasiswa();
  Future<List<Mahasiswa>> searchMahasiswa(String query);
  Future<void> addMahasiswa(Mahasiswa mahasiswa);
  Future<void> updateMahasiswa(String nim, Mahasiswa updatedMahasiswa);
  Future<void> deleteMahasiswa(String nim);
}
