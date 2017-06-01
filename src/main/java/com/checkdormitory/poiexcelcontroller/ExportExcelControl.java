package com.checkdormitory.poiexcelcontroller;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.checkdormitory.controller.DataAdminController;
import com.checkdormitory.controller.DataStatisticsController;
import com.checkdormitory.entity.StudentInfo;
import com.checkdormitory.utils.ExportExcelUtil;
import com.checkdormitory.vo.InfoVo;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/ExportExcel")
public class ExportExcelControl {

    @RequestMapping(value = "ajaxExport", method = {RequestMethod.GET, RequestMethod.POST})
    public String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("辅导员导出Excel文件！");
        OutputStream os = null;
        Workbook wb = null;    //工作薄

        try {
            List<InfoVo> lo = new ArrayList<InfoVo>();
            for (int i = 0; i < 8; i++) {
                InfoVo vo = new InfoVo();
                vo.setCode("110" + i);
                vo.setDate("2015-11-0" + i);
                vo.setMoney("1000" + i + ".00");
                vo.setName("北京中支0" + i);
                lo.add(vo);
            }

            ExportExcelUtil util = new ExportExcelUtil();
            File file = util.getExcelDemoFile("/Model.xlsx");
            String sheetName = "sheet1";
            wb = util.writeNewExcel(file, sheetName, DataStatisticsController.listInfo);

            String fileName = "最新晚未归名单.xlsx";
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8"));
            os = response.getOutputStream();
            wb.write(os);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            os.flush();
            os.close();
            wb.close();
        }
        return null;
    }

    @RequestMapping(value = "/admin")
    public void adminExportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("管理员导出Excel文件！");
        OutputStream os = null;
        Workbook wb = null;    //工作薄

        try {
            ExportExcelUtil util = new ExportExcelUtil();
            File file = util.getExcelDemoFile("/Model.xlsx");
            String sheetName = "sheet1";
            wb = util.writeNewExcel(file, sheetName, DataAdminController.listInfo);

            String fileName = "最新晚未归名单（全部）.xlsx";
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8"));
            os = response.getOutputStream();
            wb.write(os);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            os.flush();
            os.close();
            wb.close();
        }
    }
}
