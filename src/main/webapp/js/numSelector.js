/**
 * 
 */
 $(function(){
         var num1 = $("input.text_box").val();
         var price1 = $("div.price-promo-promo em").text();
         $("div.buy-point-discharge em").text(parseInt(price1*num1)-3-50+10);
      $(".add").click(function(){
          var t=$(this).parent().find('input[class*=text_box]');
         t.val(parseInt(t.val())+1);
         var num = t.val();
         var div_pay = $(this).parent().parent().parent().parent().parent();
         var price = div_pay.find("li.td-price em").text();
         div_pay.find("li.td-sum em").text(price*num);
         $("div.buy-point-discharge em.pay-sum").text(parseInt(div_pay.find("li.td-sum em").text())-3-50+10);
        })
      $(".min").click(function(){
       var t=$(this).parent().find('input[class*=text_box]');
         t.val(parseInt(t.val())-1)
         if(parseInt(t.val())<1){
          t.val(1);
          }
         var num = t.val();
         var div_pay = $(this).parent().parent().parent().parent().parent();
         var price = div_pay.find("li.td-price em").text();
         div_pay.find("li.td-sum em").text(price*num);
         $("div.buy-point-discharge em.pay-sum").text(parseInt(div_pay.find("li.td-sum em").text())-3-50+10);
       })
    }) 