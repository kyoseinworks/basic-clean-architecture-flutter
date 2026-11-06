import '../entities/mahasiswa.dart';
import '../repositories/mahasiswa_repositories.dart';

class AddMahasiswa {
  final MahasiswaRepository repo;
  AddMahasiswa(this.repo);

  Future<void> call(Mahasiswa mahasiswa) async => repo.addMahasiswa(mahasiswa);
}
