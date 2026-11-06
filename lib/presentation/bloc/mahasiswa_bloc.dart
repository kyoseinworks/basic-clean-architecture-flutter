import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/add_mahasiswa.dart';
import '../../domain/usecase/delete_mahasiswa.dart';
import '../../domain/usecase/get_all_mahasiswa.dart';
import '../../domain/usecase/search_mahasiswa.dart';
import '../../domain/usecase/update_mahasiswa.dart';
import 'mahasiswa_event.dart';
import 'mahasiswa_state.dart';

class MahasiswaBloc extends Bloc<MahasiswaEvent, MahasiswaState> {
  final GetAllMahasiswa getAllMahasiswa;
  final AddMahasiswa addMahasiswa;
  final UpdateMahasiswa updateMahasiswa;
  final DeleteMahasiswa deleteMahasiswa;
  final SearchMahasiswa searchMahasiswa;
  String _currentQuery = '';
  int _requestVersion = 0;

  MahasiswaBloc({
    required this.getAllMahasiswa,
    required this.addMahasiswa,
    required this.updateMahasiswa,
    required this.deleteMahasiswa,
    required this.searchMahasiswa,
  }) : super(MahasiswaInitial()) {
    on<LoadMahasiswaEvent>((event, emit) async {
      _currentQuery = '';
      await _loadMahasiswa(emit);
    });
    on<SearchMahasiswaEvent>((event, emit) async {
      _currentQuery = event.query.trim();
      await _loadMahasiswa(emit);
    });
    on<AddMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        await addMahasiswa(event.mahasiswa);
        await _loadMahasiswa(emit);
      } catch (e) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    });
    on<UpdateMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        await updateMahasiswa(event.nim, event.mahasiswa);
        await _loadMahasiswa(emit);
      } catch (e) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    });
    on<DeleteMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        await deleteMahasiswa(event.nim);
        await _loadMahasiswa(emit);
      } catch (e) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    });
  }

  Future<void> _loadMahasiswa(Emitter<MahasiswaState> emit) async {
    final requestVersion = ++_requestVersion;
    final query = _currentQuery;
    emit(MahasiswaLoading());
    try {
      final data = query.isEmpty
          ? await getAllMahasiswa()
          : await searchMahasiswa(query);
      if (requestVersion == _requestVersion) {
        emit(MahasiswaLoaded(data, query: query));
      }
    } catch (e) {
      if (requestVersion == _requestVersion) {
        emit(MahasiswaError(e.toString().replaceAll("Exception: ", " ")));
      }
    }
  }
}
