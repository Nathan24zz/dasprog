var penumpang= ['Doddy', undefined, 'Wahyudi'];

var tambahPenumpang = function(namaPenumpang, penumpang){
  //jika angkot kosong
  if(penumpang.length == 0)
  {
     //tambah penumpang di awal array
    penumpang.push(namaPenumpang);
    //kembalikan isi array
    return penumpang;
  }
  else{
    for(var i=0 ; i<penumpang.length ; i++){
      //jika ada kursi yang kosong
      if(penumpang[i]==undefined){
        penumpang[i]=namaPenumpang;
        return penumpang;
      }
      //jika sudah ada nama yg sama
      if(penumpang[i]==namaPenumpang){
        console.log(namaPenumpang + ' sudah ada di dalam angkot');
        return penumpang;
      }
      if(i == penumpang.length-1){
        penumpang.push(namaPenumpang);
        return penumpang;
      }
    }
  }
}

var hapusPenumpang = function(namaPenumpang, penumpang){
  if(penumpang.length == 0)
  {
    console.log('tidak ada penumpang bos');
  }
  else {
    for (var i=0; i<penumpang.length ;i++){
      if(penumpang[i]==namaPenumpang){
        penumpang[i]=undefined;
        return penumpang;
      }
      if(i == penumpang.length-1 && penumpang[i]!=namaPenumpang){
        console.log(namaPenumpang + ' tidak ada di dalam angkot');
        return penumpang;
      }
    }
  }
}