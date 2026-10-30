import '../entities/mahasiswa.dart';

abstract class MahasiswaRepository {
  List<Mahasiswa> getAllMahasiswa();
  void addMahasiswa(Mahasiswa mahasiswa);
  void updateMahasiswa(String nim, Mahasiswa updatedMahasiswa);
  void deleteMahasiswa(String nim);
}
