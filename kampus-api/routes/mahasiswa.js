import express from "express";
import db from "../db.js";

const router = express.Router();
const columns = [
    { database: "nama", api: "nama" },
    { database: "alamat", api: "alamat" },
    { database: "namaAyah", api: "nama_ayah" },
    { database: "namaIbu", api: "nama_ibu" },
    { database: "domisili", api: "domisili" },
    { database: "noTelp", api: "no_telp" },
    { database: "email", api: "email" },
    { database: "kodePost", api: "kode_post" },
    { database: "kabupaten", api: "kabupaten" },
    { database: "provinsi", api: "provinsi" },
    { database: "fakultas", api: "fakultas" },
    { database: "prodi", api: "prodi" },
    { database: "konsentrasi", api: "konsentrasi" },
    { database: "ipk", api: "ipk" },
];

const selectedColumns = [
    "nim",
    ...columns.map(({ database, api }) => `${database} AS ${api}`),
].join(", ");
const insertedColumns = ["nim", ...columns.map(({ database }) => database)].join(", ");
const placeholders = ["?", ...columns.map(() => "?")].join(", ");
const valuesFromBody = (body) => [
    body.nim,
    ...columns.map(({ api }) => body[api]),
];

router.get("/", (req, res) => {
    const search = req.query.search;
    if (search !== undefined && typeof search !== "string") {
        return res.status(400).json({ error: "Invalid search query" });
    }

    const query = search?.trim();
    const searchableColumns = [
        "nim",
        ...columns
            .filter(({ database }) => database !== "ipk")
            .map(({ database }) => database),
    ];
    const whereClause = query
        ? ` WHERE ${searchableColumns.map((column) => `${column} LIKE ?`).join(" OR ")}`
        : "";
    const values = query ? searchableColumns.map(() => `%${query}%`) : [];

    db.query(
        `SELECT ${selectedColumns} FROM mahasiswa${whereClause}`,
        values,
        (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
        },
    );
});

router.post("/", (req, res) => {
    const sql = `INSERT INTO mahasiswa (${insertedColumns}) VALUES (${placeholders})`;
    const values = valuesFromBody(req.body);
    db.query(sql, values, (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ message: "Mahasiswa added successfully" });
    });
});

router.put("/:nim", (req, res) => {
    const assignments = columns.map(({ database }) => `${database} = ?`).join(", ");
    const values = columns.map(({ api }) => req.body[api]);
    values.push(req.params.nim);
    db.query(
        `UPDATE mahasiswa SET ${assignments} WHERE nim = ?`,
        values,
        (err, result) => {
            if (err) return res.status(500).json({ error: err.message });
            if (result.affectedRows === 0) {
                return res.status(404).json({ error: "Mahasiswa not found" });
            }
            res.json({ message: "Mahasiswa updated successfully" });
        },
    );
});

router.delete("/:nim", (req, res) => {
    db.query(
        "DELETE FROM mahasiswa WHERE nim = ?",
        [req.params.nim],
        (err, result) => {
            if (err) return res.status(500).json({ error: err.message });
            if (result.affectedRows === 0) {
                return res.status(404).json({ error: "Mahasiswa not found" });
            }
            res.json({ message: "Mahasiswa deleted successfully" });
        },
    );
});

export default router;
