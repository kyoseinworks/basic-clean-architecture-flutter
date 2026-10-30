import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_praktikum_4/data/data_sources/mahasiswa_local_data_sources.dart';
import 'package:flutter_praktikum_4/data/repositories/mahasiswa_repositories_impl.dart';
import 'package:flutter_praktikum_4/domain/repositories/mahasiswa_repositories.dart';
import 'package:flutter_praktikum_4/domain/usecase/add_mahasiswa.dart';
import 'package:flutter_praktikum_4/domain/usecase/delete_mahasiswa.dart';
import 'package:flutter_praktikum_4/domain/usecase/get_all_mahasiswa.dart';
import 'package:flutter_praktikum_4/domain/usecase/update_mahasiswa.dart';
import 'package:flutter_praktikum_4/presentation/bloc/mahasiswa_bloc.dart';
import 'package:flutter_praktikum_4/presentation/bloc/mahasiswa_event.dart';
import 'package:flutter_praktikum_4/presentation/pages/mahasiswa_pages.dart';

void main() {
  final localDataSource = MahasiswaLocalDataSourceImpl();
  final MahasiswaRepository repo = MahasiswaRepositoryImpl(
    localDataSource: localDataSource,
  );

  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  final MahasiswaRepository repo;
  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clean arsitektur + bloc',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => MahasiswaBloc(
          getAllMahasiswa: GetAllMahasiswa(repo),
          addMahasiswa: AddMahasiswa(repo),
          updateMahasiswa: UpdateMahasiswa(repo),
          deleteMahasiswa: DeleteMahasiswa(repo),
        )..add(LoadMahasiswaEvent()),
        child: const MahasiswaPage(),
      ),
    );
  }
}
