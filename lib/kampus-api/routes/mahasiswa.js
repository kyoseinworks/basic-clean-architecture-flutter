import express from "express"
import db from "../db";
import { error } from "node:console";

const router = express.Router();

router.get("/", (req, res) => {
    db.query("SELECT * FROM mahasiswa", (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
});

router.post("/", (req, res) => {
    const { nim } = req.params;
    const {
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
        ipk } = req.body;
    const sql = "UPDATE mahasiswa SET  nama=?, alamat=?, namaAyah=?, namaIbu=?, domisili=?, noTelp=?, email=?, kodePost=?, kabupaten=?, provinsi=?, fakultas=?, prodi=?, konsentrasi=?, ipk=? WHERE nim=?";
    db.query(sql[nama,
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
        konsentrasi], (err, result) => {
            if (err) return res.status(500).json({ error: err.message });
            if (result.affectedRows === 0) return res.status(404).json({ message: "Mahasiswa not Found" });
            res.json({ message: "Mahasiswa updated Succesfully" });
        });
});

router.delete("/:nim", (req, res) => {
    const { nim } = req.params;
    db.query("DELETE FROM mahasiswa WHERE nim = ?", [nim], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });

        if (result.affectedRows === 0) return res.status(404).json({ message: "Mahasiswa not found" });

        res.json({ message: "Mahasiswa deleted successfully" });
    });
});
export default router;