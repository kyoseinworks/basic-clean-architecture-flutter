import '../entities/mahasiswa.dart';
import '../repositories/mahasiswa_repositories.dart';

class UpdateMahasiswa {
  final MahasiswaRepository repo;
  UpdateMahasiswa(this.repo);
  Future<void> call(String nim, Mahasiswa updatedMahasiswa) async =>
      repo.updateMahasiswa(nim, updatedMahasiswa);
}
