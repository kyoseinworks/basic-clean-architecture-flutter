import '../entities/mahasiswa.dart';
import '../repositories/mahasiswa_repositories.dart';

class AddMahasiswa {
  final MahasiswaRepository repo;
  AddMahasiswa(this.repo);
  void call(Mahasiswa mahasiswa) => repo.addMahasiswa(mahasiswa);
}
