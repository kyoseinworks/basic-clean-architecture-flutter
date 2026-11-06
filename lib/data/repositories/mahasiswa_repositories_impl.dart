import '../../domain/entities/mahasiswa.dart';
import '../../domain/repositories/mahasiswa_repositories.dart';
import '../data_sources/mahasiswa_data_source.dart';
import '../models/mahasiswa_model.dart';

class MahasiswaRepositoryImpl implements MahasiswaRepository {
  final MahasiswaDataSource dataSource;

  MahasiswaRepositoryImpl({required this.dataSource});

  @override
  Future<List<Mahasiswa>> getAllMahasiswa() async {
    final models = await dataSource.getAllMahasiswa();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Mahasiswa>> searchMahasiswa(String query) async {
    final normalizedQuery = query.trim();
    if (normalizedQuery.isEmpty) return getAllMahasiswa();

    final models = await dataSource.searchMahasiswa(normalizedQuery);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addMahasiswa(Mahasiswa mahasiswa) async {
    await dataSource.addMahasiswa(MahasiswaModel.fromEntity(mahasiswa));
  }

  @override
  Future<void> updateMahasiswa(String nim, Mahasiswa mahasiswa) async {
    await dataSource.updateMahasiswa(nim, MahasiswaModel.fromEntity(mahasiswa));
  }

  @override
  Future<void> deleteMahasiswa(String nim) async {
    await dataSource.deleteMahasiswa(nim);
  }
}
