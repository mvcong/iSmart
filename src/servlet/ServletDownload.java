package servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletDownload
 */
//@WebServlet("/ServletDownload")
public class ServletDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response, String filePath, String fileName) throws ServletException, IOException {
		System.out.println("djaksjdkajdkajdkajdkajdkajdkajdkadjsak");
		BufferedInputStream buf = null;
		ServletOutputStream myOut = null;
		try {
			myOut = response.getOutputStream();
			File myFile = new File(filePath);
			// set response headers
			response.setContentType("application/plain");
			response.addHeader("Content-Disposition", "attchment; filename=" + fileName);
			response.setContentLength((int) myFile.length());
			FileInputStream input = new FileInputStream(myFile);
			buf = new BufferedInputStream(input);
			int readBytes = 0;
			
			// read from the file; write to the ServletOutputStream
			while((readBytes = buf.read())!=-1)
				myOut.write(readBytes);
			
//			 response.getOutputStream().flush();
//			 response.getOutputStream().close();
		}catch (IOException ioe) {
			ioe.printStackTrace();
		}finally {
			// close the input/output streams
			if(myOut!=null)
				myOut.close();
			if(buf!=null)
				buf.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
