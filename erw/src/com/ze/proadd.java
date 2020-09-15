package com.ze;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

/**
 * Servlet implementation class proadd
 */
@WebServlet("/proadd")
public class proadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public proadd() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public String getDateFormat(){
	    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	    return df.format(new Date());    
	} 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String proname=request.getParameter("proname");
		String pronum=request.getParameter("pronum");
/*		String proname="";
		String pronum="";*/
		String picname="";

		
		
		//String typename=request.getParameter("typename"); 
		

/********************生成二维码图片开始********************/ 
        String twocodeimgPath = this.getServletContext().getRealPath("/twocode");   //二维码路径
        String twocodefilename=getDateFormat()+".jpg"; //时间名
        try {			
		     String content =pronum;	//商品编号,二维码内容	    	
		     MultiFormatWriter multiFormatWriter = new MultiFormatWriter();  //类里封装了
		     Map hints = new HashMap();
		     hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		     BitMatrix bitMatrix = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE, 800, 800,hints); //二维码格式，调用
		     File file1 = new File(twocodeimgPath,twocodefilename);  //指向路径(工作空间）
		     MatrixToImageWriter.writeToFile(bitMatrix, "jpg", file1);			
		 } catch (Exception e) {
		     e.printStackTrace();
		 }
        
/********************生成二维码图片结束********************/
        
        
/*********************************数据保存到到数据库*************************************/
         DBHelper Dal=new DBHelper();
         String strSql=" insert into tbproduct(proname,pronum,procodeurl) values (?,?,?) "; 
		 List<Object> params = new ArrayList<Object>();
		 params.add(proname);
		 params.add(pronum);	
		 params.add(twocodefilename);	
		 Dal.excuteSql(strSql, params);
/*********************************数据保存到到数据库*************************************/
        response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html;charset=utf-8");
   		response.getWriter().write("<font color='green'>保存成功,3秒之后发生跳转!</font>");
   		response.setHeader("Refresh", "3;URL="+request.getContextPath()+"/prolist");
		
	}

}
