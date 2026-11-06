import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/add_mahasiswa.dart';
import '../../domain/usecase/delete_mahasiswa.dart';
import '../../domain/usecase/get_all_mahasiswa.dart';
import '../../domain/usecase/update_mahasiswa.dart';
import 'mahasiswa_event.dart';
import 'mahasiswa_state.dart';

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
    on<LoadMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        final data = await getAllMahasiswa();
        emit(MahasiswaLoaded(data));
      } catch (e) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    });
    on<AddMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        await addMahasiswa(event.mahasiswa);
        final data = await getAllMahasiswa();
        emit(MahasiswaLoaded(data));
      } catch (e) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    });
    on<UpdateMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        await updateMahasiswa(event.nim, event.mahasiswa);
        final data = await getAllMahasiswa();
        emit(MahasiswaLoaded(data));
      } catch (e) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    });
    on<DeleteMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        await deleteMahasiswa(event.nim);
        final data = await getAllMahasiswa();
        emit(MahasiswaLoaded(data));
      } catch (e) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    });
  }
}
