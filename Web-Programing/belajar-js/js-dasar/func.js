function jumlah(){
  var hasil=0;
  for(var i=0; i<arguments.length; i++){
    hasil += arguments[i];
  }
  return hasil;
}

console.log(jumlah(1,2,3,4));