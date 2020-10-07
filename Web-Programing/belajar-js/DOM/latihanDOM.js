const b1 = document.getElementsByTagName('button')[0];
b1.addEventListener('click', function(){
  //document.body.style.backgroundColor = 'lightblue';
  document.body.classList.toggle('biru-muda');
  document.body.removeAttribute('style');
})

//mau buat tombol dgn js
const b2 = document.createElement('button');
const teksB2 = document.createTextNode('Acak Warna');
b2.appendChild(teksB2);
b2.setAttribute('type', 'button');
b1.after(b2);
//jika tombol di click
b2.addEventListener('click', function(){
  const r = Math.round(Math.random()*255+1);
  const g = Math.round(Math.random()*255+1);
  const b = Math.round(Math.random()*255+1);  
  document.body.style.backgroundColor = 'rgb('+r+','+ g+','+b+')';
})

//tombol yg mengganti warna background sesuai slider
const bSlider = document.getElementsByTagName('button')[2];

const redSlider = document.querySelector('input[name=redSlider]');
// let redSliderValue = 128;
// redSlider.addEventListener('change', function(){
//   redSliderValue = redSlider.value;
//   return redSliderValue;
// });

const greenSlider = document.querySelector('input[name=greenSlider]');
// let greenSliderValue = 128;
// greenSlider.addEventListener('change', function(){
//   greenSliderValue = greenSlider.value;
//   return greenSliderValue;
// })

const blueSlider = document.querySelector('input[name=blueSlider]');
// let blueSliderValue = 128;
// blueSlider.addEventListener('change', function(){
//   blueSliderValue = blueSlider.value;
//   return blueSliderValue;
// });

// bSlider.addEventListener('click', function(){
//   document.body.style.backgroundColor = 'rgb('+redSliderValue+','+greenSliderValue+','+blueSliderValue+')';
// });

//mengganti warna background langsung
document.body.removeChild(bSlider);
function ubahWarna(){
  const redSliderValue = redSlider.value;
  const greenSliderValue = greenSlider.value;
  const blueSliderValue = blueSlider.value;
  document.body.style.backgroundColor = 'rgb('+redSliderValue+','+greenSliderValue+','+blueSliderValue+')';
};

redSlider.addEventListener('input', ubahWarna);

greenSlider.addEventListener('input', ubahWarna);

blueSlider.addEventListener('input', ubahWarna);


// //mau merubah warna setiap pergerakan mouse
// document.body.addEventListener('mousemove', function(event){
//   // event.clientX untuk mengetahui posisi X mouse
//   // window.innerWidth untuk mengetahui ukuran lebar document pada browser
//   const xPos = Math.round((event.clientX/window.innerWidth)*255);
//   const yPos = Math.round((event.clientY/window.innerHeight)*255);
//   document.body.style.backgroundColor ='rgb('+xPos+','+yPos+','+'100)';
// });




