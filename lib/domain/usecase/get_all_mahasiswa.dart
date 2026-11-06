import '../entities/mahasiswa.dart';
import '../repositories/mahasiswa_repositories.dart';

class GetAllMahasiswa {
  final MahasiswaRepository repo;
  GetAllMahasiswa(this.repo);

  Future<List<Mahasiswa>> call() async => repo.getAllMahasiswa();
}
