package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import google.GooglePojo;
import iCore.dao.ObjectDAO;
import iCore.model.TaiKhoan;
import iCore.modelDAO.DAO_TaiKhoan;
import iCore.util.Util_Menu;

/**
 * Servlet implementation class OAuth2CallBack
 */
//@WebServlet("/OAuth2CallBack")
public class OAuth2CallBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OAuth2CallBack() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("entering doGet");

		try {
			// get code
			String code = request.getParameter("code");
			// format parameters to post
			String urlParameters = "code=" + code
					+ "&client_id=1065068278490-o58lnq7enkchiqa01lncqscacv35om2p.apps.googleusercontent.com"					
					+ "&client_secret=rELT9xc3y0kV2rdlB3ZDCrmJ"
					+ "&redirect_uri=http://localhost:8080/iSmart/OAuth2Callback" + "&grant_type=authorization_code";

			// post parameters
			URL url = new URL("https://accounts.google.com/o/oauth2/token");
			URLConnection urlConn = url.openConnection();
			urlConn.setDoOutput(true);
			OutputStreamWriter writer = new OutputStreamWriter(urlConn.getOutputStream());
			writer.write(urlParameters);
			writer.flush();

			// get output in outputString
			String line, outputString = "";
			BufferedReader reader = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
			while ((line = reader.readLine()) != null) {
				System.out.println(line);
				outputString += line;
			}
			System.out.println(outputString);

			// get Access Token
			JsonObject json = (JsonObject) new JsonParser().parse(outputString);
			String access_token = json.get("access_token").getAsString();
			System.out.println(access_token);

			// get User Info
			url = new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + access_token);
			urlConn = url.openConnection();
			outputString = "";
			reader = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
			while ((line = reader.readLine()) != null) {
				outputString += line;
			}
			System.out.println(outputString);

			// Convert JSON response into Pojo class
			GooglePojo data = new Gson().fromJson(outputString, GooglePojo.class);
			System.out.println(data);
			request.setAttribute("auth", data);
			writer.close();
			reader.close();

			// Chuyển trang
			String email = data.getEmail();
			String userName = email.substring(0, email.indexOf("@"));
			HttpSession session = request.getSession();
			session.setAttribute("userEmail", email);
			System.out.println(email);

			ObjectDAO<TaiKhoan> obj = new DAO_TaiKhoan();
			ArrayList<TaiKhoan> ls = new ArrayList<TaiKhoan>();
			// TaiKhoan tk = new TaiKhoan();

			ls = obj.listByColumns("email", email);

			if (ls.size() > 0) {
				TaiKhoan tk = ls.get(0);
				session.setAttribute("maDangNhap", tk.getMaDangNhap());
				session.setAttribute("chucNangs", Util_Menu.getMenu2(session.getAttribute("maDangNhap") + ""));
				response.sendRedirect("index.jsp");
			} else {
				String err = "Tài khoản không tồn tại, hoặc mật khẩu không chính xác. <br/> Liên hệ bộ phận kỹ thuật khi quên mật khẩu đăng nhập. <hr/>";
				session.setAttribute("err", err);
				response.sendRedirect("dangnhap.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
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
