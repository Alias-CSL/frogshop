package cn.barathrum.frogshop.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import cn.barathrum.frogshop.bean.Attribute;
import cn.barathrum.frogshop.bean.Sku;

public class AttributeUtil {
	
	//获取商品产品参数
	public static List<String> getProductAttribute(String json) {
//{"品牌":["花花公子"],"尺码":["M","L","XL","2XL","3XL","4XL"],"适用季节":["四季"],"细分风格":["中国风"],"领型":["立领"],"适用场景":["日常"],"衣长":["短"],"版型":["修身"],"基础风格":["青春流行"],"图案":["纯色"],"面料分类":["涤纶"],"适用对象":["青年"]}
		List<String> productAttributes = new ArrayList<>();
		if(json != null) {
			String[] arr = json.substring(1, json.length()-1).split("],");
			for(int i = 0 ; i < arr.length;i++){
				String attr = arr[i].replaceAll("\"","").replaceAll("\\[", "").replaceAll("\\]", "").trim();
				productAttributes.add(attr);
			}
			return productAttributes;
		}else{
			return null;
		}
		
	}
	
	// 提取sku中商品的各个商品销售属性
	public static List<Attribute> getSaleAttribute(List<Sku> skus) {
		if(skus != null) {
			Set<String> jsonStr = new HashSet<>();
			for (Sku sku : skus) {
				// {"颜色": "黑色","尺码":"M"}
				// 商品销售属性json字符串
				String str = sku.getAttributes();
				String[] attrs = str.substring(1, str.length() - 1).split(",");
				for (String attr : attrs) {
					jsonStr.add(attr);
				}
			}
			Map<String, Set<String>> attributes = getAttributeSet(jsonStr);
			List<Attribute> attribute =getAttribute(attributes);
			return attribute;
		}else{
			return null;
		}
		
	}

	// 将属性名与属性值封装为Attribute对象
	public static List<Attribute> getAttribute(Map<String, Set<String>> attributes) {
		List<Attribute> attributeList = new ArrayList<>();
		Set<String> names = attributes.keySet();
		Iterator iterator = names.iterator();
		while(iterator.hasNext()) {
			Attribute attr = new Attribute();//创建Attribute兑现
			String name =(String) iterator.next();//获取属性名
			attr.setName(name);//将属性名赋予name
			Set<String> values = attributes.get(name);//通过属性名获取属性值
			Iterator iterator1 = values.iterator();
			List<String> value = new ArrayList<>();//将属性值保存到list集合中
			
			while(iterator1.hasNext()) {//遍历并赋值
				String v = (String) iterator1.next();
				value.add(v);
			}
			attr.setAttributes(value);//将属性值集合添加到Attribute对象中
			attributeList.add(attr);//将对象保存到List集合中
		}
		return attributeList;
	}

	// 通过Set获取不同属性名的属性值
	public static Map<String, Set<String>> getAttributeSet(Set<String> jsonStr) {
		Map<String, Set<String>> attributes = new HashMap<>();
		Iterator<String> iterator = jsonStr.iterator();
		while (iterator.hasNext()) {
			String attr = iterator.next();
			String[] attrs = attr.split(":");
			String name = attrs[0].replace('"', ' ').trim();
			String value = attrs[1].replace('"', ' ').trim();
			Set<String> values = attributes.get(name);// 通过name获取Set集合
			if (values != null) {// 判断该集合是否之前存储过，有的话直接插值到该集合
				values.add(value);
			} else {// 否则为attributes加入新值
				SortedSet<String> values1 = new TreeSet<>();
				values1.add(value);
				attributes.put(name, values1);
			}
		}
		return attributes;
	}

	public static void main(String[] args) {
		/*
		 * String str = "{\"颜色\": \"黑色\",\"尺码\":\"M\"}";
		 * System.out.println(str.substring(1, str.length()-1).split(",")); //
		 * String str1 = "\"颜色\": \"黑色\""; //
		 * System.out.println(str1.replace('"', ' ').split(":")[1]); //
		 * Map<String,Set<String>> attr = new HashMap<>(); Set<String> set1 =
		 * new HashSet<>(); set1.add("黑色"); attr.put("颜色", set1);
		 * 
		 * Set<String> set = attr.get("颜色"); if(set != null) { set.add("白色");
		 * }else{ Set<String> set2 = new HashSet<>(); set1.add("M");
		 * attr.put("尺码", set2); }
		 * System.out.println(attr.keySet().iterator().next());
		 */
		/*SortedSet<String> sortedSet = new TreeSet<>();
		Collections.addAll(sortedSet, "1 6 2 9 89 89 3 23 32 ".split(" "));
		Iterator iterator = sortedSet.iterator();
		while (iterator.hasNext()) {
			System.out.println(iterator.next());
		}*/
		String str = "{\"品牌\":[\"花花公子\"],\"尺码\":[\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\"],\"适用季节\":[\"四季\"],\"细分风格\":[\"中国风\"],\"领型\":[\"立领\"],\"适用场景\":[\"日常\"],\"衣长\":[\"短\"],\"版型\":[\"修身\"],\"基础风格\":[\"青春流行\"],\"图案\":[\"纯色\"],\"面料分类\":[\"涤纶\"],\"适用对象\":[\"青年\"]}";
		String[] arr = str.substring(1, str.length()-1).split("],");
		for(int i = 0 ; i < arr.length;i++){
			System.out.println(arr[i].replaceAll("\"","").replaceAll("\\[", "").replaceAll("\\]", "").trim());
		}
	}
}
