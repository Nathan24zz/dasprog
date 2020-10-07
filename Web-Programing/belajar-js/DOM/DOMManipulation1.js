//DOM Manipulation
//mau nambah paragraf baru di akhir section a
//buat element baru
const pBaru = document.createElement('p');
const teksPBaru = document.createTextNode('Paragraf Baru');

//simpan tulisan ke dalam paragraf
pBaru.appendChild(teksPBaru);

//simpan pBaru di akhir section A
const sectionA = document.getElementById('a');
sectionA.appendChild(pBaru);

//=================================================================================
//mau membuat list item baru di antara item 1 dan item 2
const liBaru = document.createElement('li');
const teksLiBaru = document.createTextNode('item baru');
liBaru.appendChild(teksLiBaru);

//ambil lokasi tempat menyimpannya
const ul = document.querySelector('section#b ul');
const li2 = ul.querySelector('li:nth-child(2)');
//const li2 = document.querySelectorAll('section#b li')[1];

//simpan sebelum item 2
ul.insertBefore(liBaru,li2);

//=================================================================================
//mau menghapus link
const a = sectionA.getElementsByTagName('a')[0];
sectionA.removeChild(a);

//=================================================================================
//mau replace paragraf 4 dengan elemen baru

const sectionB = document.getElementById('b');
const p4 = sectionB.getElementsByTagName('p')[0];
//buat elemen baru
const h2 = document.createElement('h2');
const teksH2 = document.createTextNode('Teks Baru');
h2.appendChild(teksH2);

sectionB.replaceChild(h2, p4);

pBaru.style.backgroundColor = 'lightgreen';
liBaru.style.backgroundColor = 'lightgreen';
h2.style.backgroundColor = 'lightgreen';