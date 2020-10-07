nilai_penjualan = int(input('Nilai Penjualan: '))
kantung_plastik = input('Butuh Kantugn Plastik (Ya/Tidak): ')
if kantung_plastik == 'Ya':
  jumlah_plastik = int(input('Jumlah Kantung plastik: '))
elif kantung_plastik == 'Tidak':
  jumlah_plastik = 0

pajak = 0.1 * nilai_penjualan
harga_plastik = jumlah_plastik * 500
total = nilai_penjualan + pajak + harga_plastik

print('Pajak: Rp.', pajak)
print('Biaya kantung plastik: Rp.',  harga_plastik)
print('Total Akhir: Rp.', total)
