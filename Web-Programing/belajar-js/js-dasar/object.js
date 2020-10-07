//membuat object dengan object literal 
// var mhs = {
//   nama : "Nathanael Hutama",
//   umur : 18,
//   ips : [3.70, 3.80, 3.85],
//   alamat : {
//     jalan : "Jl. abc No 12",
//     kota : "Surabaya",
//     provinsi : "Jawa Timur"
//   }
// };

//membuat object dengan function declaration
function buatObjectMahasiswa(nama, nrp, jurusan){
  var mhs = {};
  mhs.nama = nama;
  mhs.nrp = nrp;
  mhs.jurusan = jurusan;
  return mhs;
}

var mhs1 = buatObjectMahasiswa('Nathanael', '123456', 'Teknik Komputer');
var mhs2 = buatObjectMahasiswa('Jerry', '234567', 'Teknik Informatika');

//membuat object dengan constructor
function Mahasiswa (nama, nrp, jurusan){
  this.nama = nama;
  this.nrp = nrp;
  this.jurusan = jurusan;
}

var mhs4 = new Mahasiswa ('Eric', '45678', 'teknik');

