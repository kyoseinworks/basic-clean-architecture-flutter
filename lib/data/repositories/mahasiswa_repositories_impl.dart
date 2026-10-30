import 'package:flutter_praktikum_4/domain/entities/mahasiswa.dart';
import 'package:flutter_praktikum_4/domain/repositories/mahasiswa_repositories.dart';
import 'package:flutter_praktikum_4/data/data_sources/mahasiswa_local_data_sources.dart';
import 'package:flutter_praktikum_4/data/models/mahasiswa_model.dart';

class MahasiswaRepositoryImpl implements MahasiswaRepository {
  final MahasiswaLocalDataSource localDataSource;

  MahasiswaRepositoryImpl({required this.localDataSource});

  @override
  List<Mahasiswa> getAllMahasiswa() {
    final mahasiswaModels = localDataSource.getAllMahasiswa();
    return mahasiswaModels.map((model) => model.toEntity()).toList();
  }

  @override
  void addMahasiswa(Mahasiswa mahasiswa) {
    final mahasiswaModel = MahasiswaModel.fromEntity(mahasiswa);
    localDataSource.addMahasiswa(mahasiswaModel);
  }

  @override
  void updateMahasiswa(String nim, Mahasiswa updatedMahasiswa) {
    final updatedModel = MahasiswaModel.fromEntity(updatedMahasiswa);
    localDataSource.updateMahasiswa(nim, updatedModel);
  }

  @override
  void deleteMahasiswa(String nim) {
    localDataSource.deleteMahasiswa(nim);
  }
}
