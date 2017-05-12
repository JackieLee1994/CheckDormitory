package com.checkdormitory.utils;

public class NumberUtil {

	public static int parseInt(String number, int initValue) {
		int temp = initValue;

		if (null != number && number.length() > 0) {
			try {
				temp = Integer.parseInt(number);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return temp;
	}

	public static int parseInt(String number) {
		return parseInt(number, 0);
	}

	public static float parseFloat(String number, float initValue) {
		float temp = initValue;

		if (null != number && number.length() > 0) {
			try {
				temp = Float.parseFloat(number);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return temp;
	}
	
	public static float parseFloat(String number){
		return parseFloat(number,0);
	}
	
	public static long parseLong(String number,long initValue){
		long temp = initValue;

		if (null != number && number.length() > 0) {
			try {
				temp = Long.parseLong(number);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return temp;
	}
	
	public static long parseLong(String number){
		return parseLong(number,0);
	}
	
	public static int[] parseIntArray(String[] temps,int initValue){
		int[] numbers={};
		
		if(null==temps || 0==temps.length)
			return numbers;
			
		numbers=new int[temps.length];
		
		for(int pos=0;pos<temps.length;pos++)
			numbers[pos]=NumberUtil.parseInt(temps[pos],initValue);
	
		return numbers;
	}

	/**
	 * @param temps
	 * @param initValue
	 * @return
	 */
	public static long[] parseLongArray(String[] temps, long initValue) {
		// TODO Auto-generated method stub
		long[] numbers={};
		
		if(null==temps || 0==temps.length)
			return numbers;
			
		numbers=new long[temps.length];
		
		for(int pos=0;pos<temps.length;pos++)
			numbers[pos]=NumberUtil.parseLong(temps[pos],initValue);
	
		return numbers;
	}

	/**
	 * @param temps
	 * @param initValue
	 * @return
	 */
	public static float[] parseFloatArray(String[] temps, float initValue) {
		// TODO Auto-generated method stub
		float[] numbers={};
		
		if(null==temps || 0==temps.length)
			return numbers;
			
		numbers=new float[temps.length];
		
		for(int pos=0;pos<temps.length;pos++)
			numbers[pos]=NumberUtil.parseFloat(temps[pos],initValue);
	
		return numbers;
	}
}
