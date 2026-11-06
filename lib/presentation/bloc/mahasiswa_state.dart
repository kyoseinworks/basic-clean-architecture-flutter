import 'package:equatable/equatable.dart';

import '../../domain/entities/mahasiswa.dart';

abstract class MahasiswaState extends Equatable {
  const MahasiswaState();
  @override
  List<Object?> get props => [];
}

class MahasiswaInitial extends MahasiswaState {}

class MahasiswaLoading extends MahasiswaState {}

class MahasiswaLoaded extends MahasiswaState {
  final List<Mahasiswa> mahasiswaList;
  final String query;

  const MahasiswaLoaded(this.mahasiswaList, {this.query = ''});

  @override
  List<Object?> get props => [mahasiswaList, query];
}

class MahasiswaError extends MahasiswaState {
  final String message;
  const MahasiswaError(this.message);
  @override
  List<Object?> get props => [message];
}
