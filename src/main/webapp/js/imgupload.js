var index = 1;
var imgIndex = 1;
$(function() {
    $("img.pic").live("click",function() {
        var pic = $(this);
        var parent = $(this).parents();
        var upload = $(this).siblings('input.upload');
        upload.click(); //隐藏了input:file样式后，点击头像就可以本地上传
        upload.on("change", function() {
            var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
            if (objUrl) {
                pic.attr("src", objUrl); //将图片路径存入src中，显示出图片
            }
        });
    });
/*    $(".upload").click(function() {
        var upload = $(this);
        var parent = $(this).parents();
        var img = parent.find('img');
        //upload.click(); //隐藏了input:file样式后，点击头像就可以本地上传
        upload.on("change", function() {
            var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
            if (objUrl) {
                pic.attr("src", objUrl); //将图片路径存入src中，显示出图片
            }
        });
    });*/
    $("button#addMore").click(function() {
        $("tbody").append($('<tr></tr>')
            .append('<td class="am-text-middle"><input type="text" name="skus['+index+'].attributes" class="attributes"  placeholder=\' "尺码":"M"，"颜色":"红色"\'/></td>')
            .append('<td class="am-text-middle"><input type="text" name="skus['+index+'].originalPrice"  class="originalPrice" /></td>')
            .append('<td class="am-text-middle"><input type="text" name="skus['+index+'].price"  class="price" /></td>')
            .append(' <td class="am-text-middle"><input type="text" name="skus['+index+'].resource" class="resource"  class="resource" /></td>')
            .append($('<td></td>').append('<img class="pic" src="images/uploadimg.png">').append('<input class="upload" name="skus['+index+'].picture" accept="image/*" type="file" style="display: none"/>'))
            .append('<td><button type="button"  class="am-btn am-btn-danger delete">删除</button></td>'));
        index++;
    });
    $("button#addMorePicture").click(function() {
        $("tbody").append($('<tr></tr>')
            .append($('<td></td>').append('<img class="pic" src="images/uploadimg.png">').append('<input class="upload" name="images['+imgIndex+']" accept="image/*" type="file" style="display: none"/>'))
            .append($('<td></td>').append('<button type="button"  class="am-btn am-btn-danger deletePic">删除</button>')));
        imgIndex++;
    });
    //删除sku记录
    $("button.delete").live('click', function() {
       var parent_tr = $(this).parent().parent();
        parent_tr.remove();
        updateTr();
      
    });
    //删除图片记录
    $("button.deletePic").live('click', function() {
       var parent_tr = $(this).parent().parent();
        parent_tr.remove();
        updatePicTr();
      
    });
});
//更新sku的name属性
function updateTr(){
    var lastIndex;
    $("tbody tr").each(function(i,tr) {
        var attributes = $(this).find('input.attributes');
        attributes.attr('name','skus['+i+'].attributes');
        var price = $(this).find('input.price');
        price.attr('name','skus['+i+'].price');
        var originalPrice = $(this).find('input.originalPrice');
        originalPrice.attr('name','skus['+i+'].originalPrice');
        var resource = $(this).find('input.resource');
        resource.attr('name','skus['+i+'].resource');
        var img = $(this).find("input.upload");
        img.attr('name','skus['+i+'].picture');
        lastIndex = i;
    });
    index = lastIndex+1;
}
//更新图片tr
function updatePicTr(){
    var lastIndex;
    $("tbody tr").each(function(i,tr) {   
        var img = $(this).find("input.upload");
        img.attr('name','images['+i+']');
        lastIndex = i;
    });
    imgIndex = lastIndex+1;
}
//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}