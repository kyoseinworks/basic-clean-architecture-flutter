import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_praktikum_4/domain/usecase/add_mahasiswa.dart';
import 'package:flutter_praktikum_4/domain/usecase/delete_mahasiswa.dart';
import 'package:flutter_praktikum_4/domain/usecase/get_all_mahasiswa.dart';
import 'package:flutter_praktikum_4/domain/usecase/update_mahasiswa.dart';
import 'package:flutter_praktikum_4/presentation/bloc/mahasiswa_event.dart';
import 'package:flutter_praktikum_4/presentation/bloc/mahasiswa_state.dart';

class MahasiswaBloc extends Bloc<MahasiswaEvent, MahasiswaState> {
  final GetAllMahasiswa getAllMahasiswa;
  final AddMahasiswa addMahasiswa;
  final UpdateMahasiswa updateMahasiswa;
  final DeleteMahasiswa deleteMahasiswa;

  MahasiswaBloc({
    required this.getAllMahasiswa,
    required this.addMahasiswa,
    required this.updateMahasiswa,
    required this.deleteMahasiswa,
  }) : super(MahasiswaInitial()) {
    on<LoadMahasiswaEvent>((event, emit) {
      emit(MahasiswaLoaded(getAllMahasiswa()));
    });
    on<AddMahasiswaEvent>((event, emit) {
      addMahasiswa(event.mahasiswa);
      emit(MahasiswaLoaded(getAllMahasiswa()));
    });
    on<UpdateMahasiswaEvent>((event, emit) {
      updateMahasiswa(event.nim, event.mahasiswa);
      emit(MahasiswaLoaded(getAllMahasiswa()));
    });
    on<DeleteMahasiswaEvent>((event, emit) {
      deleteMahasiswa(event.nim);
      emit(MahasiswaLoaded(getAllMahasiswa()));
    });
  }
}
