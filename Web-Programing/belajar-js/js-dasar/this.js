//Konsep this
// var a=10;
// console.log(this.a);
// console.log(this===window);

//cara 1 - function declaration
// function halo(){
//   console.log(this);
//   console.log('halo')
// }
// this.halo();
//this mengembalikan object global

//cara 2 - object literal
// var obj = {};
// obj.halo = function(){
//   console.log(this)
//   console.log('halo');
// }
// obj.halo();
//this mengembalikan object yg bersangkutan

//cara 3 - constructor
function Halo(nama, nrp, jurusan){
  this.nama = nama;
  this.nrp = nrp;
  this.jurusan = jurusan;
  console.log(this);
 
}
var halo1= new Halo('yanto', '12345', 'perkapalan');
var halo1= new Halo('dodi', '12346', 'mesin');
//this mengembalikan object yang baru dibuat
