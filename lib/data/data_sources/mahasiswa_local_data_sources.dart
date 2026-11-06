import '../models/mahasiswa_model.dart';
import 'mahasiswa_data_source.dart';

abstract class MahasiswaLocalDataSource implements MahasiswaDataSource {}

class MahasiswaLocalDataSourceImpl implements MahasiswaLocalDataSource {
  final List<MahasiswaModel> _mahasiswaList = [
    const MahasiswaModel(
      nim: "24SA11A138",
      nama: "yoawn",
      alamat: "sumampir",
      namaAyah: "yanto",
      namaIbu: "yanti",
      domisili: "purwokerto",
      noTelp: "086767",
      email: "yoawn@gmail.com",
      kodePost: "6767",
      kabupaten: "banyuams",
      provinsi: "jawa tengah",
      fakultas: "ilmu komputer",
      prodi: "informatika",
      konsentrasi: "multimedia",
      ipk: 4,
    ),
    const MahasiswaModel(
      nim: "nim",
      nama: "nama",
      alamat: "alamat",
      namaAyah: "namaAyah",
      namaIbu: "namaIbu",
      domisili: "domisili",
      noTelp: "noTelp",
      email: "email",
      kodePost: "kodePost",
      kabupaten: "kabupaten",
      provinsi: "provinsi",
      fakultas: "fakultas",
      prodi: "prodi",
      konsentrasi: "konsentrasi",
      ipk: 4,
    ),
  ];

  @override
  Future<List<MahasiswaModel>> getAllMahasiswa() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return List.unmodifiable(_mahasiswaList);
  }

  @override
  Future<void> addMahasiswa(MahasiswaModel mahasiswa) async {
    _mahasiswaList.add(mahasiswa);
  }

  @override
  Future<void> updateMahasiswa(String nim, MahasiswaModel mahasiswa) async {
    final index = _mahasiswaList.indexWhere((m) => m.nim == nim);
    if (index != -1) {
      _mahasiswaList[index] = mahasiswa;
    }
  }

  @override
  Future<void> deleteMahasiswa(String nim) async {
    _mahasiswaList.removeWhere((m) => m.nim == nim);
  }
}
