function getAllProvince(first_select, second_select, url,url1, name, cityName) {
	$.ajax({
		url : url,
		type : "GET",
		success : function(result) {
			if (result.code == 100) { //数据获取成功
				var results = result.extend.results;
				//var select_province = $(".edit-address select.buy-province");
				$.each(results, function(index, item) {
					if (item.name == name) {
						first_select.append($("<option selected data='" + item.id + "'>" + item.name + "</option>"));
						//var select_city = $(".edit-address select.buy-city");
						if(second_select != ""){
							getAddressMessage(second_select, url1, cityName, item.id);
						}

					} else {
						first_select.append($("<option>" + item.name + "</option>").attr("data", item.id));
					}
				});
			}
		}
	});

}


function getAddressMessage(p, url, name, data) {
	//alert("sdfsd");
	p.empty();
	var datas = encodeURI(encodeURI("id=" + data));
	//alert(datas);
	$.ajax({
		url : url,
		data : datas,
		type : "GET",
		success : function(result) {
			if (result.code == 100) { //数据获取成功
				var results = result.extend.results;
				//alert(name);
				/*if(name == ""){
					p.append($("<option selected value=''>请选择</option>"));
				}*/
				p.empty();
				var flag = false;
				$.each(results, function(index, item) {
					if (item.name == name) {
						p.append($("<option selected data='" + item.id + "'>" + item.name + "</option>"));
						flag = true;
					} else {
						p.append($("<option  data='" + item.id + "'>" + item.name + "</option>"));
					}
				});
				if(flag == false){
					p.append($("<option selected data=''>请选择</option>"));
				}
			}
		}
	});
}
			function clickHandle(first_select, sencond_select, third_select, url, name) {
				first_select.bind('change', function() {
					var data = first_select.find("option:selected").attr("data");
					//alert(data);
					//var select_city = $(".edit-address select.buy-city");
					
					getAddressMessage(sencond_select, url, name, data);
					
					if (third_select != null && third_select != "") {
						third_select.empty(); //地区option清空
						//third_select.append($("<option selected value=''>请选择</option>"));
					}
				});
}