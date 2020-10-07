// const tes = setTimeout(function(){
//   console.log('ok');
// },3000);

// const tombol = document.getElementById('tombol');
// tombol.addEventListener('click', function(){
//   clearTimeout(tes);
//   console.log('selesai');
// })

// const tes = setInterval(function(){
//   console.log('ok');
// },2000);
// const tombol = document.getElementById('tombol');
// tombol.addEventListener('click', function(){
//   clearInterval(tes);
//   console.log('selesai');
// })

//program hitung mundur
const teks = document.getElementById('teks');
const tanggalTujuan = new Date('Apr 25, 2020 14:23:00').getTime();

const hitungMundur = setInterval(function(){
  const sekarang = new Date().getTime();
  const selisih = tanggalTujuan-sekarang;

  const hari = Math.floor(selisih / (1000*60*60*24));
  const jam = Math.floor(selisih % (1000*60*60*24) / (1000*60*60));
  const menit = Math.floor(selisih % (1000*60*60) / (1000*60));
  const detik = Math.floor(selisih % (1000*60) / (1000));

  teks.innerHTML = 'Waktu anda tinggal '+hari+' hari '+jam+' jam '
  +menit+' menit '+detik+' detik lagi';

  console.log(selisih);

  if (selisih < 1000) {
    clearInterval(hitungMundur);
    teks.innerHTML = 'Waktu habis';
  }
},1000);

