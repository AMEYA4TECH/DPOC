package com.a4tech.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;



public class main {
public static void main(String[] args) {
	Integer arr[]={1,2,5,6,3,2};
	ArrayList<Integer> list = new ArrayList<Integer>(Arrays.asList(arr));
	Collections.sort(list);
	for (Integer integer : list) {
		//System.out.println(integer);
	}
	System.out.println("2nd largest number is :"+list.get(list.size()-2));
 	
	String str="mississippi";
	int k=1;
	HashMap<Character, Integer> temp=new HashMap<>();
	for (int i = 0; i < str.length(); i++) {
		if(!temp.containsKey(str.charAt(i))){
			temp.put(str.charAt(i), k);
		}else{
			int j=temp.get(str.charAt(i));
			temp.put(str.charAt(i), j+1);
		}
	}
	System.out.println(temp);

     
}
		// TODO Auto-generated constructor stub
	}
