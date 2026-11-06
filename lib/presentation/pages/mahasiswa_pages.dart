import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/mahasiswa.dart';
import '../bloc/mahasiswa_bloc.dart';
import '../bloc/mahasiswa_event.dart';
import '../bloc/mahasiswa_state.dart';

class MahasiswaPage extends StatelessWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MahasiswaBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text("yoawn")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (query) => bloc.add(SearchMahasiswaEvent(query)),
              decoration: InputDecoration(
                hintText: " ",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MahasiswaBloc, MahasiswaState>(
              builder: (context, state) {
                if (state is MahasiswaInitial || state is MahasiswaLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MahasiswaLoaded) {
                  final data = state.mahasiswaList;
                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        state.query.isEmpty
                            ? "data masih kosong. tekan + untuk menambah."
                            : "Mahasiswa tidak ditemukan.",
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      final mhs = data[i];
                      return ListTile(
                        title: Text("${mhs.nama} (${mhs.nim})"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("nim: ${mhs.nim}"),
                            Text("nama: ${mhs.nama}"),
                            Text("alamat: ${mhs.alamat}"),
                            Text("namaAyah: ${mhs.namaAyah}"),
                            Text("namaIbu: ${mhs.namaIbu}"),
                            Text("domisili: ${mhs.domisili}"),
                            Text("noTelp: ${mhs.noTelp}"),
                            Text("email: ${mhs.email}"),
                            Text("kodePost: ${mhs.kodePost}"),
                            Text("kabupaten: ${mhs.kabupaten}"),
                            Text("provinsi: ${mhs.provinsi}"),
                            Text("fakultas: ${mhs.fakultas}"),
                            Text("prodi: ${mhs.prodi}"),
                            Text("konsentrasi: ${mhs.konsentrasi}"),
                            Text("ipk: ${mhs.ipk}"),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showForm(context, bloc, mhs: mhs);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                bloc.add(DeleteMahasiswaEvent(mhs.nim));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is MahasiswaError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, bloc),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showForm(BuildContext context, MahasiswaBloc bloc, {Mahasiswa? mhs}) {
    final nimCtrl = TextEditingController(text: mhs?.nim ?? '');
    final namaCtrl = TextEditingController(text: mhs?.nama ?? '');
    final alamatCtrl = TextEditingController(text: mhs?.alamat ?? '');
    final namaAyahCtrl = TextEditingController(text: mhs?.namaAyah ?? '');
    final namaIbuCtrl = TextEditingController(text: mhs?.namaIbu ?? '');
    final domisiliCtrl = TextEditingController(text: mhs?.domisili ?? '');
    final noTelpCtrl = TextEditingController(text: mhs?.noTelp ?? '');
    final emailCtrl = TextEditingController(text: mhs?.email ?? '');
    final kodePostCtrl = TextEditingController(text: mhs?.kodePost ?? '');
    final kabupatenCtrl = TextEditingController(text: mhs?.kabupaten ?? '');
    final provinsiCtrl = TextEditingController(text: mhs?.provinsi ?? '');
    final fakultasCtrl = TextEditingController(text: mhs?.fakultas ?? '');
    final prodiCtrl = TextEditingController(text: mhs?.prodi ?? '');
    final konsentrasiCtrl = TextEditingController(text: mhs?.konsentrasi ?? '');
    final ipkCtrl = TextEditingController(text: mhs?.ipk.toString() ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(mhs == null ? "Tambah Mahasiswa" : "Edit Mahasiswa"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nimCtrl,
                decoration: const InputDecoration(labelText: "nim"),
              ),
              TextField(
                controller: namaCtrl,
                decoration: const InputDecoration(labelText: "nama"),
              ),
              TextField(
                controller: alamatCtrl,
                decoration: const InputDecoration(labelText: "alamat"),
              ),
              TextField(
                controller: namaAyahCtrl,
                decoration: const InputDecoration(labelText: "nama Ayah"),
              ),
              TextField(
                controller: namaIbuCtrl,
                decoration: const InputDecoration(labelText: "nama Ibu"),
              ),
              TextField(
                controller: domisiliCtrl,
                decoration: const InputDecoration(labelText: "domisili"),
              ),
              TextField(
                controller: noTelpCtrl,
                decoration: const InputDecoration(labelText: "no Telp"),
              ),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: "email"),
              ),
              TextField(
                controller: kodePostCtrl,
                decoration: const InputDecoration(labelText: "kodePost"),
              ),
              TextField(
                controller: kabupatenCtrl,
                decoration: const InputDecoration(labelText: "kabupaten"),
              ),
              TextField(
                controller: provinsiCtrl,
                decoration: const InputDecoration(labelText: "provinsi"),
              ),
              TextField(
                controller: fakultasCtrl,
                decoration: const InputDecoration(labelText: "fakultas"),
              ),
              TextField(
                controller: prodiCtrl,
                decoration: const InputDecoration(labelText: "prodi"),
              ),
              TextField(
                controller: konsentrasiCtrl,
                decoration: const InputDecoration(labelText: "konsentrasi"),
              ),
              TextField(
                controller: ipkCtrl,
                decoration: const InputDecoration(labelText: "ipk"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("batal"),
          ),
          ElevatedButton(
            onPressed: () {
              final mahasiswa = Mahasiswa(
                nim: nimCtrl.text,
                nama: namaCtrl.text,
                alamat: alamatCtrl.text,
                namaAyah: namaAyahCtrl.text,
                namaIbu: namaIbuCtrl.text,
                domisili: domisiliCtrl.text,
                noTelp: noTelpCtrl.text,
                email: emailCtrl.text,
                kodePost: kodePostCtrl.text,
                kabupaten: kabupatenCtrl.text,
                provinsi: provinsiCtrl.text,
                fakultas: fakultasCtrl.text,
                prodi: prodiCtrl.text,
                konsentrasi: konsentrasiCtrl.text,
                ipk: double.tryParse(ipkCtrl.text) ?? 0,
              );

              if (mhs == null) {
                bloc.add(AddMahasiswaEvent(mahasiswa));
              } else {
                bloc.add(UpdateMahasiswaEvent(mhs.nim, mahasiswa));
              }
              Navigator.pop(context);
            },
            child: const Text("simpan"),
          ),
        ],
      ),
    );
  }
}
