var basePath;
function setBasePath(url){
	basePath = url;
}
var goodId = $("input[name='goodId']").val();
alert(goodId);
//批量保存
		$("a#batchUpdate").click(function(){
			//alert("batchUpdate");
			
			$('#my-confirm2').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
					var skuArray = new Array();
					var childChecked = $('tbody input[type="checkbox"]:checked');
					//alert(childChecked.length);
		        	$.each(childChecked,function(index,item){
						var skuId = $(this).parents("tr").attr("data-id");
					    var originalPrice = $(this).parents("tr").find("input[name='originalPrice']").val();
					    var price = $(this).parents("tr").find("input[name='price']").val();
				    	var resource = $(this).parents("tr").find("input[name='resource']").val();
				    	//alert(skuId+","+originalPrice+","+price+","+resource);
				    	skuArray.push({id:skuId,goodId:goodId,originalPrice:originalPrice,price:price,resource:resource});
					});
					
					
		            $.ajax({
						url:basePath+"updateSkus",
						data:JSON.stringify(skuArray),
						type:"post",
						dataType:"json",
						contentType:"application/json;charset=utf-8",//设置请求头信息
						success:function(result){
							if(result.code == 100) {
								$("#my-alert div.am-modal-bd").empty().text(" 更新成功，你很棒棒哦！");
								$("#my-alert").modal();
							}else{
								$("#my-alert div.am-modal-bd").empty().text(" 更新失败，请再尝试！");
								$("#my-alert").modal();
							}
						}
					});
		        },
		        // closeOnConfirm: false,
		        onCancel: function() {
		          
		        }
		      });
		});
		//保存操作
		$("a#sku_save").click(function(){
			var parent = $(this);
			$('#my-confirm1').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
		        	var skuId = parent.parents("tr").attr("data-id");
		        	var originalPrice = parent.parents("tr").find("input[name='originalPrice']").val();
		        	var price = parent.parents("tr").find("input[name='price']").val();
		        	var resource = parent.parents("tr").find("input[name='resource']").val();
		        	//alert(resource);
		           $.ajax({
						url:basePath+"updateGoodSku",
						data:"id="+skuId+"&goodId="+goodId+"&originalPrice="+originalPrice+"&price="+price+"&resource="+resource,
						type:"post",
						success:function(result){
							if(result.code == 100) {
								$("#my-alert div.am-modal-bd").empty().text(" 更新成功，你很棒棒哦！");
								$("#my-alert").modal();
							}else{
								$("#my-alert div.am-modal-bd").empty().text(" 更新失败，请再尝试！");
								$("#my-alert").modal();
							}
						}
					}); 
		        },
		        // closeOnConfirm: false,
		        onCancel: function() {
		          
		        }
		      });
		});
		//批量删除操作
		$("a.batchDel").click(function(){
			var childChecked = $('tbody input[type="checkbox"]:checked');
			var data = "";
			
			$('#my-confirm3').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
		        	$.each(childChecked,function(index,item){
						var skuId = $(this).parents("tr").attr("data-id");
						data += skuId+",";
					});
					var skuIds = data.substr(0, data.length-1);
		            $.ajax({
						url:basePath+"deleteSkus",
						data:"skuIds="+skuIds+"&goodId="+goodId,
						type:"post",
						success:function(result){
							if(result.code == 100) {
								$.each(childChecked,function(index,item){
									$(this).parents("tr").remove();
								});
							}
						}
					});
		        },
		        // closeOnConfirm: false,
		        onCancel: function() {
		          
		        }
		      });
		});
		//删除操作
		$("a.sku_del").click(function(){
			var parent = $(this).parents("tr");
			var skuId = parent.attr("data-id");
			 $('#my-confirm').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
		            $.ajax({
						url:basePath+"delOneSku",
						data:"skuId="+skuId+"&goodId="+goodId,
						type:"post",
						success:function(result){
							if(result.code == 100) {
								parent.remove();
							}
						}
					});
		        },
		        // closeOnConfirm: false,
		        onCancel: function() {
		          
		        }
		      });
			
		});
		//判断ckeckbox是否全部被选中了
		$("tbody input[type='checkbox']").click(function(){
			var child = $(this).parents('table').find('tbody input[type="checkbox"]');
				var childChecked = $(this).parents('table').find('tbody input[type="checkbox"]:checked');
				if (childChecked.length == child.length) {
					$(this).parents('table').find('thead input#allChoose').get(0).checked = true;
				} else {
					$(this).parents('table').find('thead input#allChoose').get(0).checked = false;
				}
		});
		//全选按钮
		$("thead input#allChoose").click(function(data){
			var value = $(this).prop("checked");
			//alert(value);
			var child = $('tbody input[type="checkbox"]');
			child.each(function(index, item) {
				$(this).prop("checked",value);
			});
		});
	/* layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;

            
          laypage({
					cont: 'page',
					pages: 10 //总页数
						,
					groups: 5 //连续显示分页数
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
						}
					}
				});

          laypage({
					cont: 'page2',
					pages: 10 //总页数
						,
					groups: 5 //连续显示分页数
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
						}
					}
				});
    });
 */