package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



/**
 * Servlet implementation class Servlet_upload
 */
@WebServlet("/Servlet_upload")
@MultipartConfig(fileSizeThreshold=1024*1024*2, maxFileSize=1024*1024*10, maxRequestSize=1024*1024*50)
public class Servlet_upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("Servlet_Upload.doPost()");
    	String savePath = "/Users/alexandrseppenen/eclipse-workspace/Targo/WebContent/images/" ;
    	
    	System.out.println("Polku on: " + savePath);
    	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_Upload.doPost()");
		String savePath = "/Users/alexandrseppenen/eclipse-workspace/Targo/WebContent/images/uploads" ;
    	
    	
    	HttpSession session = request.getSession(true);
    	
    	System.out.println("Polku on: " + savePath); //Shows the path from where server is serving not the path of your source code        
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }  
        String fileName="";
        String fullname="";
        LocalTime now = LocalTime.now();
       
    	String id = session.getId();
    	String nimi = now.getMinute() + now.getSecond() + id;
    	
    	
    	for (Part part : request.getParts()) {
            fileName = extractFileName(part);            
            fileName = new File(fileName).getName();   
             fullname =  nimi+"_"+fileName;
            part.write(savePath + File.separator +fullname);
        } 
    	
    	PrintWriter out = response.getWriter();
    	
	    System.out.println("nimi "+ fullname);
	    
	    out.println(fullname);	
    }
   
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}