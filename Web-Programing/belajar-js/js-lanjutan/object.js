//cara membuat object pada js
//1. Object Literal
//PROBLEM tidak efektif untuk objek yang banyak
// let nathan = {
//   nama : 'Nathanael',
//   energi : 10,
//   makan : function(porsi){
//     this.energi = this.energi + porsi;
//     console.log(`halo ${this.nama}, selamat makan!`);
//   }
// }

// let hutama = {
//   nama : 'Hutama',
//   energi : 20,
//   makan : function(porsi){
//     this.energi = this.energi + porsi;
//     console.log(`halo ${this.nama}, selamat makan!`);
//   }
// }

//2. Function Declaration
//methodnya dipisah karena jika methodnya ditulis di dalam fungsinya langsung, maka setiap inisiasi object, method dibuat ulang 
//PROBLEM jika ingin buat method baru, masih harus mendaftarkan di Mahasiswa ( TIDAK PRAKTIS) --> makanya pake Object.create()
// const methodMahasiswa = {
//   makan : function(porsi){
//     this.energi += porsi;
//     console.log(`halo ${this.nama}, selamat makan!`);
//   },
//   main : function(jam){
//     this.energi -= jam;
//     console.log(`halo ${this.nama}, selamat bermain`);
//   },
//   tidur : function(jam){
//     this.energi += jam*2;
//     console.log(`halo ${this.nama}, selamat tidur`);
//   }
// }

// let Mahasiswa = function(nama, energi){
//   let mahasiswa = Object.create(methodMahasiswa);
//   mahasiswa.nama = nama;
//   mahasiswa.energi = energi;
//   //tidak perlu ditulis krn sdh ada Object.create()
//   // mahasiswa.makan = methodMahasiswa.makan;
//   // mahasiswa.main = methodMahasiswa.main;
//   // mahasiswa.tidur = methodMahasiswa.tidur;
//   return mahasiswa;
// }

// let nathan = Mahasiswa('Nathanael', 10);
// let hutama = Mahasiswa('Hutama',20);

//3. Constructor Function
// function Mahasiswa(nama, energi){
//   //yg terjadi di belakang layar
//   //let this = Object.create(Mahasiswa.prototype)
//   this.nama = nama;
//   this.energi = energi;
//   // this.makan = function(porsi){
//   //   this.energi += porsi;
//   //   console.log(`halo ${this.nama}, selamat makan!`);
//   // }
//   // this.main = function(jam){
//   //   this.energi -= jam;
//   // }
//   //return this;
// }
// Mahasiswa.prototype.makan = function(porsi){
//   this.energi += porsi;
//   return `halo ${this.nama}, selamat makan!`;
// }
// Mahasiswa.prototype.main = function(jam){
//   this.energi -= jam;
//   return `halo ${this.nama}, selamat main`;
// }

// let nathan = new Mahasiswa('Nathanael', 10);
// let hutama = new Mahasiswa('Hutama',20);

//yang diatas itu membuat object dengan menggunakan prototype inheritance
//skrng mau membuat sm spt no 3, tapi menggunakan class
//versi Class
class Mahasiswa{
  constructor(nama, energi){
    this.nama = nama;
    this.energi = energi;
  }

  makan(porsi){
    this.energi += porsi;
    return `halo ${this.nama}, selamat makan!`;
  }
  main(jam){
    this.energi -= jam;
    return `halo ${this.nama}, selamat main`;
  }
}

let nathan = new Mahasiswa('Nathanael', 10);
let hutama = new Mahasiswa('Hutama',20);

//untuk ngecek semua method pada objek Array, Object, ataupun Number
//Array.prototype
//Object.prototype
//Number.prototype 

