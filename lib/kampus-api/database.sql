CREATE DATABASE IF NOT EXIST praktikum5;
USE praktikum5;

CREATE TABLE IF NOT EXIST mahasiswa (
    nim VARCHAR(8) NOT NULL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
    namaAyah VARCHAR(100) NOT NULL,
    namaIbu VARCHAR(100) NOT NULL,
    domisili VARCHAR(100) NOT NULL,
    noTelp VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    kodePost VARCHAR(100) NOT NULL,
    kabupaten VARCHAR(100) NOT NULL,
    provinsi VARCHAR(100) NOT NULL,
    fakultas VARCHAR(100) NOT NULL,
    prodi VARCHAR(100) NOT NULL,
    konsentrasi VARCHAR(100) NOT NULL,
    ipk DECIMAL(3, 2) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO mahasiswa (
    nim,
    nama,
    alamat,
    namaAyah,
    namaIbu,
    domisili,
    noTelp,
    email,
    kodePost,
    kabupaten,
    provinsi,
    fakultas,
    prodi,
    konsentrasi,
    ipk,)
VALUES (
    24138
    YOANDINATA DHARMA PUTRA
    SUMAMPIR
    YANTO
    YANTI
    PURWOKERTO
    086767
    yoawn@gmail.com
    6767
    Banyumas
    Jawa Tengah
    Ilmu Komputer
    Informatika
    Multimedia
    3.99
)
ON DUPLICATE KEY UPDATE nama=VALUES(nama);