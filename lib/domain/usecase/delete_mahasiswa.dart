import '../repositories/mahasiswa_repositories.dart';

class DeleteMahasiswa {
  final MahasiswaRepository repo;
  DeleteMahasiswa(this.repo);
  void call(String nim) => repo.deleteMahasiswa(nim);
}
