// const closeButton = document.getElementsByClassName('close')[0];
// const card = document.getElementsByClassName('card')[0];
// closeButton.addEventListener('click', function(){
//   card.style.display = 'none';
// })

//DOM Traversal
const closeButton = document.querySelectorAll('.close');

// for(let i=0; i<closeButton.length; i++){
//   closeButton[i].addEventListener('click',function(e){
//     //closeButton[i].parentElement.style.display = 'none';
//     e.target.parentElement.style.display = 'none';
//   })
// }

//program sdh bisa jalan tp belum efektif
// closeButton.forEach(function(el){
//   el.addEventListener('click', function(e){
//     e.target.parentElement.style.display = 'none';
//     e.preventDefault(); //menghentikan event default a
//     e.stopPropagation(); //menghentikan event bubbling
//   });
// });

// const cards = document.querySelectorAll('.card');
// cards.forEach(function(card){
//   card.addEventListener('click', function(e){
//     alert('ok');
//   })
// })

//jika mau lebih efektif programnya
const container = document.querySelector('.container');
container.addEventListener('click', function(e){
  if(e.target.className == 'close'){
    e.preventDefault();
    e.target.parentElement.style.display = 'none';
  }
})

//mencoba DOM Traversal
// const nama = document.querySelector('.nama');
// console.log(nama.parentElement.parentElement);
// console.log(nama.previousElementSibling);
// console.log(nama.nextElementSibling.nextElementSibling);
// console.log(nama.nextSibling.nextSibling);
