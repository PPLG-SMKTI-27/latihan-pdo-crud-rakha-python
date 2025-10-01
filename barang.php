<?php
require_once "database.php";

class barang {
    private $pdo;

    public function __construct() {
        $db = new Database();
        $this->pdo = $db->getConnection();
    }

    // CREATE
    public function tambahBarang($id_barang, $nama, $id_kategori, $stok, $harga) {
        $sql = "INSERT INTO barang (id_barang, nama, id_kategori, stok, harga) VALUES (:id_barang, :nama, :id_kategori, :stok, :harga)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(":id_barang", $id_barang);
        $stmt->bindParam(":nama", $nama);
        $stmt->bindparam(":id_kategori", $id_kategori);
        $stmt->bindparam(":stok", $stok);
        $stmt->bindparam(":harga", $harga);
        return $stmt->execute();
    }

    // READ
    public function tampilBarang() {
        $sql = "SELECT * FROM barang";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // UPDATE
    public function ubahBarang($id_barang, $nama, $id_kategori, $stok, $harga) {
        $sql = "UPDATE barang SET id_barang= :id_barang, nama= :nama, id_kategori= :id_kategori, stok= :stok, harga= :harga WHERE id_barang=:id_barang";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(":id_barang", $id_barang);
        $stmt->bindParam(":nama", $nama);
        $stmt->bindparam(":id_kategori", $id_kategori);
        $stmt->bindparam(":stok", $stok);
        $stmt->bindparam(":harga", $harga);
        return $stmt->execute();
    }

    // DELETE 
    public function hapusBarang($id_barang) {
        $sql = "DELETE FROM barang WHERE id_barang=:id_barang";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(":id_barang", $id);
        return $stmt->execute();
    }
}
