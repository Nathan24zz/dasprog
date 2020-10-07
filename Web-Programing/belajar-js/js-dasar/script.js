// var inputan = parseInt(prompt('masukkan angka :'));
// if(inputan%2 === 0){alert('bilangan genap');}
// else {alert('bilangan ganjil');}


// var angkotTotal=10, angkotBaik=6, angka;
// for(angka=1;angka<=angkotTotal;angka++){
//   if(angka ===5 || angka === 8 || angka === 10){
//     console.log('Angkot No. ' + angka + ' sedang lembur');}
//   else if(angka<=angkotBaik){
//     console.log('Angkot No. ' + angka + ' beroperasi dengan baik');
//   }
//   else {console.log('Angkot No. ' + angka + ' sedang tidak beroperasi');}
// }

// var item = prompt('masukkan nama makanan / minuman : \n (cth:nasi, daging, susu, pizza, burger');
// switch (item){
//   case 'nasi':
//   case 'daging':
//   case 'susu':
//     alert('makanan/minuman SEHAT');
//     break;
//   case 'pizza':
//   case 'burger':
//     alert('makanan/minuman TIDAK SEHAT');
//     break;
//   default:
//     alert('seng gena bro');
//     break;
// }

var s='',a=0;
var angka = prompt('masukkan angka : ');
for(var i=0; i<angka; i++){
  for(var k=angka-1; k>i; k--){
    s += ' ';
  }
  for(var j=0; j<=i; j++){
    a += 1;
    s += a;
    s += ' ';
   }
  s += '\n';
}
console.log(s);

// console.log('' + '* ' + 1)
