import '../entities/mahasiswa.dart';
import '../repositories/mahasiswa_repositories.dart';

class UpdateMahasiswa {
  final MahasiswaRepository repo;
  UpdateMahasiswa(this.repo);
  void call(String nim, Mahasiswa updatedMahasiswa) =>
      repo.updateMahasiswa(nim, updatedMahasiswa);
}
