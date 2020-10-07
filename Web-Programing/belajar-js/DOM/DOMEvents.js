//1. event Handler
//inline HTML
const p3 = document.querySelector('.p3');
function ubahWarnaP3(){
  p3.style.background = 'lightblue';
}

//Element method
const p2 = document.querySelector('.p2');
function ubahWarnaP2(){
  p2.style.background = 'lightblue';
}
p2.onclick = ubahWarnaP2;

//2. addEventListener
const p4 = document.querySelector('section#b p');
p4.addEventListener('mouseenter', function(){
  const ul = document.getElementsByTagName('ul')[0];
  const li = document.createElement('li');
  const li3 = ul.getElementsByTagName('li')[2];
  const teksLi = document.createTextNode('Item Baru');
  li.appendChild(teksLi);
  li.style.backgroundColor = 'salmon';
  ul.insertBefore(li,li3);
});

//================================================================================================
//perbedaan event handler dan addEventListener()
//Event Handler akan menimpa perubahan sebelumnya

// const p3 = document.querySelector('.p3');
// p3.onclick = function(){
//   p3.style.backgroundColor = 'lightblue';
// }
// p3.onclick = function(){
//   p3.style.color = 'red';
// }

//addEventListener() akan menambah semua perubahannya
// const p3 = document.querySelector('.p3');
// p3.addEventListener('click', function(){
//   p3.style.backgroundColor = 'lightblue';
// })
// p3.addEventListener('click', function(){
//   p3.style.color = 'red';
// })
