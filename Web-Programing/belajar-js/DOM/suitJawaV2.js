//seleksi elemen
const imgComp = document.getElementsByClassName('img-komputer')[0];
const imgGajah = document.querySelector('.area-player .gajah');
const imgOrang = document.querySelector('.area-player .orang');
const imgSemut = document.querySelector('.area-player .semut');
const info = document.getElementsByClassName('info')[0];

function getCompChoice(){
  let compChoice = Math.floor(Math.random()*3) + 1;

  //mengganti angka random menjadi gajah/orang/semut
  if(compChoice == 1) {compChoice = 'gajah';}
  else if(compChoice == 2) {compChoice = 'orang';}
  else {compChoice ='semut';} 

  //mengganti gambar sesuai pilihan komputer
  imgComp.setAttribute('src', 'img/'+compChoice+'.png');

  return compChoice;
}

function getResult(player, comp){
  if (comp == player) return 'SERI!';
  if (player == 'gajah') return (comp == 'semut') ? 'KALAH!':'MENANG!';
  if (player == 'orang') return (comp == 'gajah') ? 'KALAH!':'MENANG!';
  if (player == 'semut') return (comp == 'orang') ? 'KALAH!':'MENANG!';
}

function shuffle(){
  const image = ['gajah','orang', 'semut'];
  const timeStart = new Date().getTime();
  let i = 0;
  setInterval(function(){
    if(new Date().getTime() - timeStart > 1000){
      clearInterval;
      return;
    }
    imgComp.setAttribute('src', 'img/'+image[i++]+'.png');
    if (i>image.length){i=0;}
  },100)
}

let scoreForComp = 0;
let scoreForPlayer = 0;
const scoreComp = document.querySelector('.scoreComp');
const scorePlayer = document.querySelector('.scorePlayer');
const choice = document.querySelectorAll('li img');

choice.forEach(function(pilihan){
  pilihan.addEventListener('click', function(){
    const playerChoice = pilihan.getAttribute('class');
    info.innerHTML = '';
    shuffle();
   
    setTimeout(function(){
      const compChoice = getCompChoice();
      //hasil
      info.innerHTML = getResult(playerChoice,compChoice);
      //untuk scoring
      if(info.innerHTML == 'MENANG!'){
        scoreForPlayer++
        scorePlayer.innerHTML = 'SCORE: '+scoreForPlayer;
      }
      if(info.innerHTML == 'KALAH!'){
        scoreForComp++
        scoreComp.innerHTML = 'SCORE: '+scoreForComp;
      }
    },1000);
  })
})

//    //jika masih bingung pake forEach 
// imgGajah.addEventListener('click', function(){
//   const playerChoice = imgGajah.getAttribute('class');
//   const compChoice = getCompChoice();

//   //hasil
//   info.innerHTML = getResult(playerChoice,compChoice);
// });

// imgOrang.addEventListener('click', function(){
//   const playerChoice = imgOrang.getAttribute('class');
//   const compChoice = getCompChoice();

//   //hasil
//   info.innerHTML = getResult(playerChoice,compChoice);
// });

// imgSemut.addEventListener('click', function(){
//   const playerChoice = imgSemut.getAttribute('class');
//   const compChoice = getCompChoice();

//   //hasil
//   info.innerHTML = getResult(playerChoice,compChoice);
// });



