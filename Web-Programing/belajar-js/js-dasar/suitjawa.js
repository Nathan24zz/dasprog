var tanya = true;
while(tanya){
  //menangkap input player
  var p = prompt('pilih : gajah, semut, orang');

  //menangkap random comp
  //membangkitkan angka random
  var comp = Math.floor(Math.random()*3) + 1; 

  if(comp == 1) {comp = 'gajah';}
  else if(comp == 2) {comp = 'orang';}
  else {comp ='semut';} 

  var hasil='';
  //rules
  if (p == comp) {hasil='SERI!';}
  else if(p == 'gajah'){
  // if (comp == 'semut') {hasil='KALAH';}
  // else if(comp == 'orang') {hasil='MENANG';}
    hasil = (comp == 'semut') ? 'KALAH!' : 'MENANG!';
  }
  else if(p == 'semut'){
    hasil = (comp == 'orang') ? 'KALAH!' : 'MENANG!';
  }
  else if(p == 'orang'){
    hasil = (comp == 'gajah') ? 'KALAH!' : 'MENANG!';
  }
  else {hasil = 'masukin yang bener woi!!';}

  //hasil
  alert('Kamu memilih : ' + p + ' dan Komputer memilih : ' + comp + '\nMaka hasilnya ' + hasil);

  tanya = confirm('lagi?');
}
alert('suwon');