import '../repositories/mahasiswa_repositories.dart';

class DeleteMahasiswa {
  final MahasiswaRepository repo;
  DeleteMahasiswa(this.repo);
  Future<void> call(String nim) async => repo.deleteMahasiswa(nim);
}
