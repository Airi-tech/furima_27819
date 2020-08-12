$('#price').change(function(){
  let p = $("#price").val();
  let pri = parseInt(p);
  let tax = Math.trunc(pri * 0.1);
  let pro = pri - tax;

  let pattern =	/^[1-9][0-9]*$/;
  if (pattern.test(p)){
    taxx = tax.toLocaleString()
    prox = pro.toLocaleString()
    $('#tax').text(taxx);
    $('#profit').text(prox);
  }else{
    $('#tax').text("半角数字のみ入力可能");
    $('#profit').text("半角数字のみ入力可能");
  }
});