import 'package:equatable/equatable.dart';

import '../../domain/entities/mahasiswa.dart';

abstract class MahasiswaEvent extends Equatable {
  const MahasiswaEvent();
  @override
  List<Object?> get props => [];
}

class LoadMahasiswaEvent extends MahasiswaEvent {}

class AddMahasiswaEvent extends MahasiswaEvent {
  final Mahasiswa mahasiswa;
  const AddMahasiswaEvent(this.mahasiswa);
  @override
  List<Object?> get props => [mahasiswa];
}

class UpdateMahasiswaEvent extends MahasiswaEvent {
  final String nim;
  final Mahasiswa mahasiswa;
  const UpdateMahasiswaEvent(this.nim, this.mahasiswa);
  @override
  List<Object?> get props => [nim, mahasiswa];
}

class DeleteMahasiswaEvent extends MahasiswaEvent {
  final String nim;
  const DeleteMahasiswaEvent(this.nim);
  @override
  // TODO: implement props
  List<Object?> get props => [nim];
}
