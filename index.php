<?php
require_once "barang.php";

$barang = new barang();

// CREATE
$barang->tambahBarang(8,"baju kepin",5,8,200000);

// READ
echo "<h3>Data barang</h3>";
$data = $barang->tampilBarang();
foreach ($data as $row) {
    echo $row['id_barang'] . " - " . $row['nama'] . " - " . $row['id_kategori'] ." - ". $row['stok']. "(". $row['harga'].")";
}

// UPDATE
$barang->ubahBarang(1, "raka ganteng", 5, 20, 200987);

//DELETE
$barang->hapusBarang(2);
?>



?>
