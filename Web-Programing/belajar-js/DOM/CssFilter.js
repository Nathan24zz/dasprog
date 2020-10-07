//seleksi elemem yang diinginkan
const gambar = document.getElementsByTagName('img')[0];
const label = document.querySelector('label[for=code]');
const blurSlider = document.querySelector('input[name=blur]');
const grayScaleSlider = document.querySelector('input[name=grayScale]');
const dropShadowSlider = document.querySelector('input[name=dropShadow]');
const sepiaSlider = document.querySelector('input[name=sepia]');

//jika slider digeser maka
function ubahGambar(){
  //buat variabel untuk menampung nilai slider
  const blurSliderValue = blurSlider.value;
  const grayScaleSliderValue = grayScaleSlider.value*0.1;
  const dropShadowSliderValue = dropShadowSlider.value;
  const sepiaSliderValue = sepiaSlider.value*0.1;

  //buat variabel untuk mengganti tulisan pada gambar.style.filter
  let blurText='blur('+blurSliderValue+'px)';
  let grayScaleText='grayscale('+grayScaleSliderValue+')';
  let dropShadowText = 'drop-shadow('+dropShadowSliderValue+'px '+dropShadowSliderValue+'px '+'20px black)';
  let sepiaText = 'sepia('+sepiaSliderValue+')';

  //supaya jika nilainya 0 tidak ditulis
  if (blurSliderValue == 0){blurText='';}
  if (grayScaleSliderValue == 0){grayScaleText='';}
  if (dropShadowSliderValue == 0){dropShadowText='';}
  if (sepiaSliderValue == 0){sepiaText='';}
  //jika nilainya tdk nol maka sesuai dengan deklarasi awalnya
  if(blurSliderValue != 0 && grayScaleSliderValue != 0 && dropShadowSliderValue != 0
    && sepiaSliderValue != 0){}

  //supaya jika nilainya 0 semua, yang ditulis none
  if (blurSliderValue == 0 && grayScaleSliderValue == 0 && dropShadowSliderValue == 0
    && sepiaSliderValue == 0){
    gambar.style.filter = 'none';
  }
  else {
  gambar.style.filter = blurText+' '+grayScaleText+' '+dropShadowText+' '+sepiaText;}

  //untuk mengganti tulisan labelnya
  label.innerHTML = '-webkit-filter:'+gambar.style.filter;
}
//event 
blurSlider.addEventListener('input', ubahGambar);
grayScaleSlider.addEventListener('input', ubahGambar);
dropShadowSlider.addEventListener('input', ubahGambar);
sepiaSlider.addEventListener('input', ubahGambar);