package com.checkdormitory.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DateUtil {
	public final static SimpleDateFormat SIMPLE_FORMAT=new SimpleDateFormat("yyyy-MM-dd");
	
	public final static SimpleDateFormat LONG_FORMAT=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
	
	public final static HashMap<String, Object> formatPool;
	
	static{
		formatPool=new HashMap<String, Object>();
		formatPool.put("yyyy-MM-dd",SIMPLE_FORMAT);
		formatPool.put("yyyy-MM-dd kk:mm:ss",LONG_FORMAT);
	}
	
	private final static Log log=LogFactory.getLog(DateUtil.class);
	
	public static SimpleDateFormat getDateFormat(String format){
		SimpleDateFormat dateFormat=(SimpleDateFormat)formatPool.get(format);
		
		if(null==dateFormat){
			synchronized(DateUtil.class){
				if(null==formatPool.get(format)){
					dateFormat=new SimpleDateFormat(format);
					formatPool.put(format,dateFormat);
				}
			}
		}
		
		return dateFormat;
	}
	
	public static Date parseDate(String format,String date){
	    SimpleDateFormat fmt=getDateFormat(format);
	    Date dt=null;
	    try {
            dt=fmt.parse(date);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            log.error(e);
        }
        
        return dt;
	}
	
	public static Date parseDate(SimpleDateFormat format,String date){
	    Date dt=null;
	    
	    try{
	        dt=format.parse(date);
	    }
	    catch(Exception e){
	        log.error(e);
	    }
	    
	    return dt;
	}
	
	public static Date parseDate(String string){
		Date date=null;
		
		if(null==string || 0==string.length())
			return null;
			
		try {
			if(string.length()>10)
				date=LONG_FORMAT.parse(string);
			else
				date=SIMPLE_FORMAT.parse(string);
		} catch (ParseException e) {
			log.error(e);
		}
		
		return date;
	}
	
	public static Date parseDate(Object object){
		if(object instanceof Date)
			return (Date)object;
			
		if(object instanceof Calendar)
			return ((Calendar)object).getTime();
			
		return parseDate(object.toString());
	}
	
	public static Calendar parseCalendar(Object format,String string){
		Calendar cal=null;
		Date date=null;
		
		if(format instanceof SimpleDateFormat)
		    date=parseDate((SimpleDateFormat)format,string);
		else
		    date=parseDate(format.toString(),string);
		
		if(null!=date){
			cal=Calendar.getInstance();
			cal.setTime(date);
		}
		
		return cal;
	}
		
	public static Calendar parseCalendar(String string){
		Calendar cal=null;
		Date date=null;
		
		date=parseDate(string);
		
		if(null!=date){
			cal=Calendar.getInstance();
			cal.setTime(date);
		}
		
		return cal;
	}
	
	public static Calendar parseCalendar(Object object){
		Calendar cal=Calendar.getInstance();
		
		if(object instanceof Date){
			cal.setTime((Date)object);
			return cal;
		}
			
		if(object instanceof Calendar)
			return (Calendar)object;
			
		return parseCalendar(object.toString());
	}
	
	public static Calendar parseCalendar(Date date){
	    
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        
        return c;
	}
	
	public static String parseString(String fmt, Date date) {
	    return getDateFormat(fmt).format(date); 
	}
	
    //输入GregorianCalendar时间
    public static GregorianCalendar DATEADD(String datepart, int number,
            GregorianCalendar inputdate) {
        int normalDatepart = 0;
        datepart = datepart.toLowerCase();
        if (datepart.equals("y") || datepart.equals("yy")
                || datepart.equals("yyy") || datepart.equals("yyyy"))
            normalDatepart = GregorianCalendar.YEAR;
        if (datepart.equals("m") || datepart.equals("mm"))
            normalDatepart = GregorianCalendar.MONTH;
        if (datepart.equals("d") || datepart.equals("dd"))
            normalDatepart = GregorianCalendar.DATE;
        if (datepart.equals("wk") || datepart.equals("ww")) {
            normalDatepart = GregorianCalendar.DATE;
            number = number * 7;
        }
        if (datepart.equals("hh") || datepart.equals("h"))
            normalDatepart = GregorianCalendar.HOUR;
        if (datepart.equals("mi"))
            normalDatepart = GregorianCalendar.MINUTE;
        if (datepart.equals("s") || datepart.equals("ss"))
            normalDatepart = GregorianCalendar.SECOND;
        if (datepart.equals("ms"))
            normalDatepart = GregorianCalendar.MILLISECOND;
        GregorianCalendar tempDate = new GregorianCalendar();
        tempDate.setTime(inputdate.getTime());
        tempDate.add(normalDatepart, number);
        return tempDate;
    }
    
    //输入字符串
    public static String DATEADD(String datepart, int number, String strInputDate) {
        GregorianCalendar gcResult = new GregorianCalendar();
        String outDate = "";
        String formatType = "yyyy-MM-dd";
        String tempInputDate = "";
        if (strInputDate.indexOf(".") >= 0)
            formatType = "yyyy.MM.dd";
        tempInputDate = strInputDate;
        if (strInputDate.indexOf(".") >= 0)
            formatType = "yyyy.MM.dd";
        if (tempInputDate.indexOf(":") >= 0) //判断是哪种格式.
            formatType = formatType + " hh:mm";
        tempInputDate = tempInputDate.substring(tempInputDate.indexOf(":") + 1);
        if (tempInputDate.indexOf(":") >= 0)
            formatType = formatType + ":ss";

        SimpleDateFormat formatter = new SimpleDateFormat(
                formatType);
        java.text.ParsePosition pos = new java.text.ParsePosition(0);
        Date sourceDate = formatter.parse(strInputDate, pos);
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(sourceDate);
        gcResult = DATEADD(datepart, number, gc);
        String strDate = formatter.format(gcResult.getTime());
        outDate = strDate;
        if (formatType.equals("yyyy-MM-dd hh:mm")
                || formatType.equals("yyyy-MM-dd hh:mm:ss")
                || formatType.equals("yyyy.MM.dd hh:mm")
                || formatType.equals("yyyy.MM.dd hh:mm:ss")) //如果是下午，则要加12个小时。
        {
            if (gcResult.get(Calendar.AM_PM) == 1) //AM_PM的值 1代表下午 0 代表上午
            {
                String strPMHour = Integer.toString(Integer.parseInt(strDate
                        .substring(11, 13)) + 12);
                outDate = strDate.substring(0, 11) + strPMHour
                        + strDate.substring(13);
            }
        }
        return outDate;
    }
    public static String getDataTime(){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String dateTime = format.format(date);
		return dateTime;
	}
	
	public static String getTime_yyyyMMddHHmmsss(){
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmsss");
		Date date = new Date();
		String dateTime = format.format(date);
		return dateTime;
	}
    //输入Date
    public static Date DATEADD(String datepart, int number, Date dateInputDate) {
        GregorianCalendar gc = new GregorianCalendar();
        GregorianCalendar gcResult = new GregorianCalendar();
        gc.setTime(dateInputDate);
        gcResult = DATEADD(datepart, number, gc);
        return gcResult.getTime();
    }
    public static String getTime_yyyyMMdd(){
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String dateTime = format.format(date);
		return dateTime;
	}
    
    public static String getMonthOne(){
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
        //获取前月的第一天
        Calendar   cal_1=Calendar.getInstance();//获取当前日期 
        cal_1.add(Calendar.MONTH, 0);
        cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
        String firstDay = format.format(cal_1.getTime());
    	return firstDay;
    }
    
    public static String getMonthLast(){
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
        //获取前月的第一天
    	Calendar ca = Calendar.getInstance();    
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
        String last = format.format(ca.getTime());
    	return last;
    }

    public static long getDiffTime(Date date1,Date date2){
    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	long diff = 0 ;
    	try
    	{
	    	//Date d1 = df.parse(Date1);
	    	//Date d2 = df.parse(Date2);
    		Date d1 = date1;
    		Date d2 = date2;
	    	diff = d1.getTime() - d2.getTime();
	    	//long days = diff / (1000 * 60 * 60 * 24);
    	}
    	catch (Exception e)
    	{
    		e.printStackTrace();
    	}
    	return diff;
    }
    public static int getDay(String date1,String date2){
    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	long diff = 0 ;
    	int days = 0 ;
    	try
    	{
	    	Date d1 = df.parse(date1);
	    	Date d2 = df.parse(date2);
    		
	    	diff = d1.getTime() - d2.getTime();
	        days =(int)(diff / (1000 * 60 * 60 * 24));
    	}
    	catch (Exception e)
    	{
    		e.printStackTrace();
    	}
    	return days;
    }
    
    public static float getHourse(String date1,String date2){
    	DateFormat df = new SimpleDateFormat("HH:mm");
    	long diff = 0 ;
    	float house = 0 ;
    	try
    	{
	    	Date d1 = df.parse(date1);
	    	Date d2 = df.parse(date2);
    		
	    	diff = d1.getTime() - d2.getTime();
	    	house =(float)(diff / (float)(1000 * 60 * 60 ));
    	}
    	catch (Exception e)
    	{
    		e.printStackTrace();
    	}
    	return house;
    }

    public static String dateFormat(Date date){
    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	if(date!=null){
    		return df.format(date);
    	}else{
    		return "";
    	}
    }
    public static float getHourse1(String date1,String date2){
    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	long diff = 0 ;
    	float house = 0 ;
    	try
    	{
	    	Date d1 = df.parse(date1);
	    	Date d2 = df.parse(date2);
    		
	    	diff = d1.getTime() - d2.getTime();
	    	house =(float)(diff / (float)(1000 * 60 * 60 ));
    	}
    	catch (Exception e)
    	{
    		e.printStackTrace();
    	}
    	return house;
    }
    public static void main(String[] args) throws ParseException {
        //String nw = DateUtil.parseString("yyyyMMddHHmmssSSS", new Date());
    	//Calendar date = DateUtil.parseCalendar("1442308553000");
        //System.out.println(getDiffTime());
    	/*DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String date1="2015-11-11 16:12:47.777";
    	String date2="2015-11-13 16:24:44.050";
    	long time = DateUtil.getDiffTime(df.parse(date2), df.parse(date1));
    	float house = (float)time/(1000 * 60*60);
    	System.out.println(house);*/
    	
    	/*System.out.println(getHourse("0:30","0:00"));
    	 Date date = DateUtil.DATEADD("hh", -10, new Date());
    	System.out.println(date);*/
    	DateFormat df = new SimpleDateFormat("HH");
		String house = df.format(new Date());
		System.out.println(house);
    	
    	
    	
    }
}
