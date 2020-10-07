const jumbo = document.getElementsByClassName('jumbo')[0];
const thumbnails = document.getElementsByClassName('thumbnail')[0];
const thumb = document.querySelectorAll('.thumb');

thumbnails.addEventListener('click', function(e){
  jumbo.src = e.target.src;
  jumbo.classList.add('fade');
  setTimeout(function(){
    jumbo.classList.remove('fade');
  },500);

  thumb.forEach(function(e){
    e.className = 'thumb';
  })

  e.target.classList.add('active');
})