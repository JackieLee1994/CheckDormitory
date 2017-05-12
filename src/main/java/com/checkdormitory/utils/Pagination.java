package com.checkdormitory.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 生成分页导航条
 */
public class Pagination extends TagSupport {

    /**
     *
     */
    private static final long serialVersionUID = 845588836550471554L;

    public static final String START_ROW = "startRow";

    private static Log logger = LogFactory.getLog(Pagination.class);

    private Page parameter;

    public Page getParameter() {
        return parameter;
    }

    public void setParameter(Page parameter) {
        this.parameter = parameter;
    }

    /* （非 Javadoc）
     * @see javax.servlet.jsp.tagext.Tag#doStartTag()
     */
    public int doStartTag() throws JspException {
        ServletRequest request = pageContext.getRequest();
        try {
            String pagination = addPagination(parameter, request);
            JspWriter out = pageContext.getOut();
            out.write(pagination);
        } catch (Exception e) {
            logger.error("create pagination error", e);
            throw new JspException("create pagination error", e);
        }
        return SKIP_BODY;
    }

    @SuppressWarnings("unchecked")
    public String getParams(HttpServletRequest request) {
        StringBuffer sb = new StringBuffer();
        Enumeration em = request.getParameterNames();
        while (em.hasMoreElements()) {
            String paramName = (String) em.nextElement();
            if (paramName.equals(START_ROW))//忽略页数参数
                continue;
            String paramValue = request.getParameter(paramName);
            if (paramValue == null)
                paramValue = "";
            sb.append(paramName);
            sb.append("=");
            try {
                sb.append(URLEncoder.encode(paramValue, "utf-8"));
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException("请求参数进行URLEncoder时出错", e);
            }
            sb.append("&");
        }
        return sb.toString();
    }

    public String addPagination2(Page page, HttpServletRequest request) {
        StringBuffer sb = new StringBuffer("<div class=\"pages\" style='width:100%;align:right'>");
        sb.append("<span class=\"number\">");
        sb.append("共查到");
        sb.append(page.getTotal());
        sb.append("条记录&nbsp;");
        sb.append("</span>");
        sb.append("<span class=\"number\">");
        if (page.isPreviousPageAvailable()) {
            sb.append("<span title=\"首页\"><a href=\"javascript:toPage(1);\">首页</a></span>");
            sb.append("<span title=\"上一页\"><a href=\"javascript:toPage(" + page.getPreviousPageNumber() + ");\">上一页</a></span>");
        } else {
            sb.append("<span title=\"首页\">首页</span>");
            sb.append("<span title=\"上一页\">上一页</span>");
        }
        if (page.isNextPageAvailable()) {
            sb.append("<span title=\"下一页\"><a href=\"javascript:toPage(" + page.getNextPageNumber() + ");\">下一页</a></span>");
            sb.append("<span title=\"末页\"><a href=\"javascript:toPage(" + page.getPages() + ");\">末页</a></span>");
        } else {
            sb.append("<span title=\"下一页\">下一页</span>");
            sb.append("<span title=\"末页\">末页</span>");
        }
        sb.append("</span>");
        sb.append("<select name=\"toPages\" id=\"toPages\" onchange=\"toPage(this);\">");
        for (int i = 1; i <= page.getPages(); i++) {
            if (page.getCurrentPageNumber() == i)
                sb.append("<option value=\"" + i + "\" selected=\"selected\">" + i + " / " + page.getPages() + "</option>");
            else
                sb.append("<option value=\"" + i + "\">" + i + " / " + page.getPages() + "</option>");
        }
        sb.append("</select>");
        sb.append("</div>");
        sb.append("<script type=\"text/javascript\">");
        sb.append("function toPage(page){var turnTo = 1;alert(page);if (typeof(page) == 'object') {turnTo = page.options[page.selectedIndex].value;} else {turnTo = page;}createUrl(turnTo);}");
        sb.append("function createUrl(page){var url = location.protocol + '//' + location.host + location.pathname;url += '?" + this.getParams(request) + "';var startRow = (page-1) * " + page.getSize() + ";url += '" + START_ROW + "=' + startRow;location.href = url;}");
        sb.append("</script>");
        return sb.toString();
    }

    public String addPagination(Page page, HttpServletRequest request) {
        StringBuffer sb = new StringBuffer("<div class=\"pagin\">");
        sb.append("<div class=\"message\">");
        sb.append("共查到");
        sb.append("<i class=\"blue\">" + page.getTotal() + "</i>");
        sb.append("条记录&nbsp;");
        sb.append("</div>");
        sb.append("<ul class=\"paginList\">");
        if (page.isPreviousPageAvailable()) {
            sb.append("<li class=\"paginItem\" title=\"首页\"><a href=\"javascript:toPage(1);\">首页</a></li>");
            sb.append("<li class=\"paginItem\" title=\"上一页\"><a href=\"javascript:toPage(" + page.getPreviousPageNumber() + ");\">上一页</a></li>");
        } else {
            sb.append("<li class=\"paginItem\" title=\"首页\">首页</li>");
            sb.append("<li class=\"paginItem\" title=\"上一页\">上一页</li>");
        }
        if (page.isNextPageAvailable()) {
            sb.append("<li class=\"paginItem\" title=\"下一页\"><a href=\"javascript:toPage(" + page.getNextPageNumber() + ");\">下一页</a></li>");
            sb.append("<li class=\"paginItem\" title=\"末页\"><a href=\"javascript:toPage(" + page.getPages() + ");\">末页</a></li>");
        } else {
            sb.append("<li class=\"paginItem\" title=\"下一页\">下一页</li>");
            sb.append("<li class=\"paginItem\" title=\"末页\">末页</li>");
        }

        sb.append("<li class=\"paginItem\" ><div class=\"vocation\">" +
                "<select name=\"toPages\" class=\"select3\" id=\"toPages\" onchange=\"toPage(this);\">");
        for (int i = 1; i <= page.getPages(); i++) {
            if (page.getCurrentPageNumber() == i)
                sb.append("<option value=\"" + i + "\" selected=\"selected\">" + i + " / " + page.getPages() + "</option>");
            else
                sb.append("<option value=\"" + i + "\">" + i + " / " + page.getPages() + "</option>");
        }
        sb.append("</select></div></li>");
        sb.append("</ul>");
        sb.append("</div>");
        sb.append("<script type=\"text/javascript\">");
        sb.append("function toPage(page){var turnTo = 1;alert(page);if (typeof(page) == 'object') {turnTo = page.options[page.selectedIndex].value;} else {turnTo = page;}createUrl(turnTo);}");
        sb.append("function createUrl(page){var url = location.protocol + '//' + location.host + location.pathname;url += '?" + this.getParams(request) + "';var startRow = (page-1) * " + page.getSize() + ";url += '" + START_ROW + "=' + startRow;location.href = url;}");
        sb.append("</script>");

        //System.out.println("str====="+sb.toString());

        return sb.toString();
    }

    @SuppressWarnings("unchecked")
    public String getParams(ServletRequest request) throws Exception {
        StringBuffer sb = new StringBuffer();
        Enumeration em = request.getParameterNames();
        while (em.hasMoreElements()) {
            String paramName = (String) em.nextElement();
            if (paramName.equals(START_ROW))//忽略页数参数
                continue;
            String paramValue = request.getParameter(paramName);
            if (paramValue == null)
                paramValue = "";
            sb.append(paramName);
            sb.append("=");
            try {
                sb.append(URLEncoder.encode(paramValue, "utf-8"));
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException("请求参数进行URLEncoder时出错", e);
            }
            sb.append("&");
        }
        return sb.toString();
    }

    public String addPagination2(Page page, ServletRequest request) throws Exception {
        StringBuffer sb = new StringBuffer("<div class=\"pages\" style='width:100%;align:right'>");
        sb.append("<span class=\"number\">");
        sb.append("共查到");
        sb.append(page.getTotal());
        sb.append("条记录&nbsp;");
        sb.append("</span>");
        sb.append("<span class=\"number\">");
        if (page.isPreviousPageAvailable()) {
            sb.append("<span title=\"首页\"><a href=\"javascript:toPage(1);\">首页</a></span>");
            sb.append("<span title=\"上一页\"><a href=\"javascript:toPage(" + page.getPreviousPageNumber() + ");\">上一页</a></span>");
        } else {
            sb.append("<span title=\"首页\">首页</span>");
            sb.append("<span title=\"上一页\">上一页</span>");
        }
        if (page.isNextPageAvailable()) {
            sb.append("<span title=\"下一页\"><a href=\"javascript:toPage(" + page.getNextPageNumber() + ");\">下一页</a></span>");
            sb.append("<span title=\"末页\"><a href=\"javascript:toPage(" + page.getPages() + ");\">末页</a></span>");
        } else {
            sb.append("<span title=\"下一页\">下一页</span>");
            sb.append("<span title=\"末页\">末页</span>");
        }
        sb.append("</span>");
        sb.append("<select name=\"toPages\" id=\"toPages\" onchange=\"toPage(this);\">");
        for (int i = 1; i <= page.getPages(); i++) {
            if (page.getCurrentPageNumber() == i)
                sb.append("<option value=\"" + i + "\" selected=\"selected\">" + i + " / " + page.getPages() + "</option>");
            else
                sb.append("<option value=\"" + i + "\">" + i + " / " + page.getPages() + "</option>");
        }
        sb.append("</select>");
        sb.append("</div>");
        sb.append("<script type=\"text/javascript\">");
        sb.append("function toPage(page){var turnTo = 1;if (typeof(page) == 'object') {turnTo = page.options[page.selectedIndex].value;} else {turnTo = page;}createUrl(turnTo);}");
        sb.append("function createUrl(page){var url = location.protocol + '//' + location.host + location.pathname;url += '?" + this.getParams(request) + "';var startRow = (page-1) * " + page.getSize() + ";url += '" + START_ROW + "=' + startRow;location.href = url;}");
        sb.append("</script>");
        return sb.toString();
    }

    public String addPagination(Page page, ServletRequest request) throws Exception {
        StringBuffer sb = new StringBuffer("<div class=\"pagin\">");
        sb.append("<div class=\"message\">");
        sb.append("共查到");
        sb.append("<i class=\"blue\">" + page.getTotal() + "</i>");
        sb.append("条记录&nbsp;");
        sb.append("</div>");
        sb.append("<ul class=\"paginList\">");
        if (page.isPreviousPageAvailable()) {
            sb.append("<li class=\"paginItem\" title=\"首页\"><a href=\"javascript:toPage(1);\">首页</a></li>");
            sb.append("<li class=\"paginItem\" title=\"上一页\"><a href=\"javascript:toPage(" + page.getPreviousPageNumber() + ");\">上一页</a></li>");
        } else {
            sb.append("<li class=\"paginItem\" title=\"首页\"><a>首页</a></li>");
            sb.append("<li class=\"paginItem\" title=\"上一页\"><a>上一页</a></li>");
        }
        if (page.isNextPageAvailable()) {
            sb.append("<li class=\"paginItem\" title=\"下一页\"><a href=\"javascript:toPage(" + page.getNextPageNumber() + ");\">下一页</a></li>");
            sb.append("<li class=\"paginItem\" title=\"末页\"><a href=\"javascript:toPage(" + page.getPages() + ");\">末页</a></li>");
        } else {
            sb.append("<li class=\"paginItem\" title=\"下一页\"><a>下一页</a></li>");
            sb.append("<li class=\"paginItem\" title=\"末页\"><a>末页</a></li>");
        }


        sb.append("<li class=\"paginItem\" ><div class=\"vocation\">" +
                "<select name=\"toPages\" id=\"toPages\" onchange=\"toPage(this);\" class=\"select3\">");
        for (int i = 1; i <= page.getPages(); i++) {
            if (page.getCurrentPageNumber() == i)
                sb.append("<option value=\"" + i + "\" selected=\"selected\">" + i + " / " + page.getPages() + "</option>");
            else
                sb.append("<option value=\"" + i + "\">" + i + " / " + page.getPages() + "</option>");
        }
        sb.append("</select></div></li>");
        sb.append("</ul>");
        sb.append("</div>");
        sb.append("<script type=\"text/javascript\">");
        sb.append("function toPage(page){var turnTo = 1;if (typeof(page) == 'object') {turnTo = page.options[page.selectedIndex].value;} else {turnTo = page;}createUrl(turnTo);}");
        sb.append("function createUrl(page){var url = location.protocol + '//' + location.host + location.pathname;url += '?" + this.getParams(request) + "';var startRow = (page-1) * " + page.getSize() + ";url += '" + START_ROW + "=' + startRow;location.href = url;}");
        sb.append("</script>");
        System.out.println("<<<<<<==addPagination===>>>>>>" + sb.toString());
        return sb.toString();
    }
}
