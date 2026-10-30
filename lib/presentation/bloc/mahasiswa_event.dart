import 'package:flutter_praktikum_4/domain/entities/mahasiswa.dart';

abstract class MahasiswaEvent {}

class LoadMahasiswaEvent extends MahasiswaEvent {}

class AddMahasiswaEvent extends MahasiswaEvent {
  final Mahasiswa mahasiswa;
  AddMahasiswaEvent(this.mahasiswa);
}

class UpdateMahasiswaEvent extends MahasiswaEvent {
  final String nim;
  final Mahasiswa mahasiswa;
  UpdateMahasiswaEvent(this.nim, this.mahasiswa);
}

class DeleteMahasiswaEvent extends MahasiswaEvent {
  final String nim;
  DeleteMahasiswaEvent(this.nim);
}
