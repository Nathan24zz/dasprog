const menuToogle = document.getElementsByClassName('menu-toggle')[0];
const span1 = menuToogle.getElementsByTagName('span')[0];
const span2 = menuToogle.getElementsByTagName('span')[1];
const span3 = menuToogle.getElementsByTagName('span')[2];
const ul = document.querySelector('nav ul');
let temp = 0;

menuToogle.addEventListener('click', function(){
  span1.classList.toggle('animation1');
  span2.classList.toggle('animation2');
  span3.classList.toggle('animation3');
  // agar menu terlihat seperti keluar dari samping
  // beri class animation0, 0.1 detik kemudian baru beri class animation01
  if(temp%2==0){
    ul.classList.toggle('animation0');
    setTimeout(function(){
      ul.classList.toggle('animation01');
    },100)
    temp+=1;
  }
  // agar menu terlihat seperti keluar ke samping
  // hilangkan class animation01, 1 detik kemudian hilangkan class animation0
  else{
    ul.classList.toggle('animation01');
    setTimeout(function(){
      ul.classList.toggle('animation0');
    },1000)
    temp+=1;
  }
  
  
})