import '../entities/mahasiswa.dart';
import '../repositories/mahasiswa_repositories.dart';

class SearchMahasiswa {
  final MahasiswaRepository repo;

  SearchMahasiswa(this.repo);

  Future<List<Mahasiswa>> call(String query) => repo.searchMahasiswa(query);
}
