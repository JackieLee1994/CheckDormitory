package com.checkdormitory.utils;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HttpUtil {

    HttpServletRequest request;
    HttpServletResponse response;

    public HttpUtil(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public void send(String string) {
        // TODO Auto-generated method stub
        try {
            response.sendRedirect(string);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void dispatcher(String url) {
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int parseInt(String paramName, int initValue) {
        return NumberUtil.parseInt(request.getParameter(paramName), initValue);
    }

    public int parseInt(String paramName) {
        return parseInt(paramName, 0);
    }

    public float parseFloat(String paramName, float initValue) {
        return NumberUtil.parseFloat(request.getParameter(paramName), initValue);
    }

    public float parseFloat(String paramName) {
        return parseFloat(paramName, 0);
    }


    public long parseLong(String paramName, long initValue) {
        return NumberUtil.parseLong(request.getParameter(paramName), initValue);
    }

    public long parseLong(String paramName) {
        return parseLong(paramName, 0);
    }

    public Date parseDate(String paramName, String format) {
        return parseDateByString(request.getParameter(paramName), format);
    }

    private Date parseDateByString(String value, String format) {
        Date date = null;

        if (null != value && value.length() > 0) {
            try {
                date = DateUtil.getDateFormat(format).parse(value);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return date;
    }

    public Calendar parseCalendarByString(String value, String format) {
        Calendar cal = Calendar.getInstance();
        Date date = parseDateByString(value, format);
        cal.setTime(date);

        return cal;
    }

    public Calendar parseCalendar(String paramName, String format) {
        return parseCalendarByString(request.getParameter(paramName), format);
    }

    public int[] parseIntArray(String paramName, int initValue) {
        String[] temps = request.getParameterValues(paramName);
        return NumberUtil.parseIntArray(temps, initValue);
    }

    public int[] parseIntArray(String paramName) {
        return parseIntArray(paramName, 0);
    }

    public long[] parseLongArray(String paramName, long initValue) {
        String[] temps = request.getParameterValues(paramName);
        return NumberUtil.parseLongArray(temps, initValue);
    }

    public long[] parseLongArray(String paramName) {
        return parseLongArray(paramName, 0);
    }

    public float[] parseFloatArray(String paramName, float initValue) {
        String[] temps = request.getParameterValues(paramName);
        return NumberUtil.parseFloatArray(temps, initValue);
    }

    public float[] parseFloatArray(String paramName) {
        return parseFloatArray(paramName, 0);
    }

    public Date[] parseDateArray(String paramName, String format) {
        Date[] dates = {};
        String[] temps = request.getParameterValues(paramName);

        if (null == temps || 0 == temps.length)
            return dates;

        dates = new Date[temps.length];
        for (int pos = 0; pos < temps.length; pos++)
            dates[pos] = parseDateByString(temps[pos], format);

        return dates;
    }

    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
