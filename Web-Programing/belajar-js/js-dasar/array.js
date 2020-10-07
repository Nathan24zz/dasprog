//menampilkan isi array
// var a = ["nathan","jerry", "hutama"];

// for(var i=0; i<a.length ; i++){
//   console.log('Mahasiswa ke ' + (i+1) + ' :' + a[i]);
// }

//method pada array
var arr = ['Nathan', 'Jerry', 'Hutama'];
//1. Join
// console.log(arr.join(' - '));

//2. Push & Pop
// arr.pop();
// arr.push('Harsono', 'Chrystian');
// console.log(arr.join(' - '));

//3. Unshift & Shift
// arr.shift();
// arr.unshift('Harsono');
// console.log(arr.join(' - '));

//4. Splice
// arr.splice(1,2,'Harsono');
// console.log(arr.join(' - '));

//5 Slice
// var a = arr.slice(1,3)
// console.log(a.join(' - '));

// //6. forEach -->tidak bisa mengembalikan array
// var angka = [1,2,3,4,5,6,7,8];
// arr.forEach(function(e, i){
//   console.log('Mahasiswa ke ' + (i+1) + ' adalah ' + e );
// });

//7. map --> bisa mengembalikan array
// var angka2 = angka.map(function(e){
//   return e*2;
// });
// console.log(angka2.join(' - '))

//8. sort --> mengurutkan nilai
var angka3 = [1,3,5,2,7,10,20];
// angka3.sort(function(a,b){
//   return a-b;
// });
// console.log(angka3.join(' - '));

//9. filter (bisa mengembalikan banyak nilai) & find (menghasilkan 1 nilai)
var angka4 = angka3.filter(function(x){
  return x > 5;
})
console.log(angka4.join(' - '));