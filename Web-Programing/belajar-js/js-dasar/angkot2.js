//membuat object angkot
function Angkot(sopir, trayek, penumpang, kas){
  this.sopir = sopir;
  this.trayek = trayek;
  this.penumpang = penumpang;
  this.kas = kas;

  this.penumpangNaik = function(namaPenumpang){
    this.penumpang.push(namaPenumpang);
    return this.penumpang;
  }

  this.penumpangTurun = function(namaPenumpang, bayar){
    if (this.penumpang.length == 0){
      alert('penumpang masih kosong');
      return false;
    }

    else{
      for (var i=0; i<this.penumpang.length; i++){
        if (this.penumpang[i]==namaPenumpang){
          this.penumpang[i]=undefined;
          this.kas += bayar;

          console.log('jumlah kas sekarang = ' + this.kas);
          return this.penumpang;
        }
        if (i == this.penumpang.length-1){
          alert('tidak ada penumpang bernama ' + namaPenumpang);
          return false;
        }
      }
    }
    
  }
}

var angkot1 = new Angkot('Yanto', ['Cicaheum','Cibiru'], [], 0);
var angkot2 = new Angkot('Tom', ['Antapani','Ciroyom'], [], 0);