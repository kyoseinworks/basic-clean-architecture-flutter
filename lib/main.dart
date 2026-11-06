import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import 'data/data_sources/mahasiswa_remote_data_source.dart';
import 'data/repositories/mahasiswa_repositories_impl.dart';
import 'domain/repositories/mahasiswa_repositories.dart';
import 'domain/usecase/add_mahasiswa.dart';
import 'domain/usecase/delete_mahasiswa.dart';
import 'domain/usecase/get_all_mahasiswa.dart';
import 'domain/usecase/search_mahasiswa.dart';
import 'domain/usecase/update_mahasiswa.dart';
import 'presentation/bloc/mahasiswa_bloc.dart';
import 'presentation/bloc/mahasiswa_event.dart';
import 'presentation/pages/mahasiswa_pages.dart';

void main() {
  final apiHost = defaultTargetPlatform == TargetPlatform.android
      ? '10.0.2.2'
      : 'localhost';
  final remoteDataSource = MahasiswaRemoteDataSourceImpl(
    baseUrl: 'http://$apiHost:3000/api/mahasiswa',
  );
  final MahasiswaRepository repo = MahasiswaRepositoryImpl(
    dataSource: remoteDataSource,
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
          searchMahasiswa: SearchMahasiswa(repo),
        )..add(LoadMahasiswaEvent()),
        child: const MahasiswaPage(),
      ),
    );
  }
}
