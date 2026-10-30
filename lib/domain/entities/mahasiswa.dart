class Mahasiswa {
  final String nim;
  final String nama;
  final String alamat;
  final String namaAyah;
  final String namaIbu;
  final String domisili;
  final String noTelp;
  final String email;
  final String kodePost;
  final String kabupaten;
  final String provinsi;
  final String fakultas;
  final String prodi;
  final String konsentrasi;
  final double ipk;

  Mahasiswa({
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.namaAyah,
    required this.namaIbu,
    required this.domisili,
    required this.noTelp,
    required this.email,
    required this.kodePost,
    required this.kabupaten,
    required this.provinsi,
    required this.fakultas,
    required this.prodi,
    required this.konsentrasi,
    required this.ipk,
  });

  Mahasiswa copyWith({
    String? nim,
    String? nama,
    String? alamat,
    String? namaAyah,
    String? namaIbu,
    String? domisili,
    String? noTelp,
    String? email,
    String? kodePost,
    String? kabupaten,
    String? provinsi,
    String? fakultas,
    String? prodi,
    String? konsentrasi,
    double? ipk,
  }) {
    return Mahasiswa(
      nim: nim ?? this.nim,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      namaAyah: namaAyah ?? this.namaAyah,
      namaIbu: namaIbu ?? this.namaIbu,
      domisili: domisili ?? this.domisili,
      noTelp: noTelp ?? this.noTelp,
      email: email ?? this.email,
      kodePost: kodePost ?? this.kodePost,
      kabupaten: kabupaten ?? this.kabupaten,
      provinsi: provinsi ?? this.provinsi,
      fakultas: fakultas ?? this.fakultas,
      prodi: prodi ?? this.prodi,
      konsentrasi: konsentrasi ?? this.konsentrasi,
      ipk: ipk ?? this.ipk,
    );
  }
}
