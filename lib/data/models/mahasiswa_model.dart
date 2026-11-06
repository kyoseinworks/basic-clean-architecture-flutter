import '../../domain/entities/mahasiswa.dart';

class MahasiswaModel extends Mahasiswa {
  const MahasiswaModel({
    required super.nim,
    required super.nama,
    required super.alamat,
    required super.namaAyah,
    required super.namaIbu,
    required super.domisili,
    required super.noTelp,
    required super.email,
    required super.kodePost,
    required super.kabupaten,
    required super.provinsi,
    required super.fakultas,
    required super.prodi,
    required super.konsentrasi,
    required super.ipk,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      nim: json['nim'].toString(),
      nama: json['nama'].toString(),
      alamat: json['alamat'].toString(),
      namaAyah: json['nama_ayah'].toString(),
      namaIbu: json['nama_ibu'].toString(),
      domisili: json['domisili'].toString(),
      noTelp: json['no_telp'].toString(),
      email: json['email'].toString(),
      kodePost: json['kode_post'].toString(),
      kabupaten: json['kabupaten'].toString(),
      provinsi: json['provinsi'].toString(),
      fakultas: json['fakultas'].toString(),
      prodi: json['prodi'].toString(),
      konsentrasi: json['konsentrasi'].toString(),
      ipk: json['ipk'] is num
          ? (json['ipk'] as num).toDouble()
          : double.tryParse(json['ipk']?.toString() ?? '0') ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'nama': nama,
      'alamat': alamat,
      'nama_ayah': namaAyah,
      'nama_ibu': namaIbu,
      'domisili': domisili,
      'no_telp': noTelp,
      'email': email,
      'kode_post': kodePost,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'fakultas': fakultas,
      'prodi': prodi,
      'konsentrasi': konsentrasi,
      'ipk': ipk,
    };
  }

  factory MahasiswaModel.fromEntity(Mahasiswa entity) {
    return MahasiswaModel(
      alamat: entity.alamat,
      domisili: entity.domisili,
      email: entity.email,
      fakultas: entity.fakultas,
      ipk: entity.ipk,
      kabupaten: entity.kabupaten,
      kodePost: entity.kodePost,
      konsentrasi: entity.konsentrasi,
      nama: entity.nama,
      namaAyah: entity.namaAyah,
      namaIbu: entity.namaIbu,
      nim: entity.nim,
      noTelp: entity.noTelp,
      prodi: entity.prodi,
      provinsi: entity.provinsi,
    );
  }

  Mahasiswa toEntity() {
    return Mahasiswa(
      alamat: alamat,
      domisili: domisili,
      email: email,
      fakultas: fakultas,
      ipk: ipk,
      kabupaten: kabupaten,
      kodePost: kodePost,
      konsentrasi: konsentrasi,
      nama: nama,
      namaAyah: namaAyah,
      namaIbu: namaIbu,
      nim: nim,
      noTelp: noTelp,
      prodi: prodi,
      provinsi: provinsi,
    );
  }
}
