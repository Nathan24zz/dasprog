// DOM Selection
// document.getElementById()
const judul = document.getElementById('judul');
judul.style.color = 'red'; //jadi inline css
judul.style.backgroundColor = '#ccc';
judul.innerHTML = 'Nathanael';

// document.getElementsByTagName() --> HTMLCollection
const p = document.getElementsByTagName('p');
for(let i=0; i<p.length; i++){
  p[i].style.backgroundColor = 'lightblue';
}

const h1 = document.getElementsByTagName('h1')[0];
h1.style.fontSize = '50px';

//document.getElementsByClassName() --> HTMLCollection
const p1 = document.getElementsByClassName('p1');
p1[0].innerHTML = 'ini diubah dari javascript';

