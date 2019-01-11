package iCore.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.DungCu;
import iCore.model.LichSuTap;
import iCore.model.ThanhVien;
import iCore.modelDAO.DAO_LichSuTap;
import iCore.modelDAO.DAO_ThanhVien;
import iCore.util.Util_Date;
import servlet.ServletDownload;

public class Controller_LichSuTap extends LichSuTap implements ZEController {
	ObjectDAO dao = new DAO_LichSuTap();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/lichsutaps.jsp";
	String duongDanTrangView = "iCore/pages/lichsutap.jsp";
	String tenCotTimDoiTuong = "maLST";
	String maObj;
	String s_ngayTap;
	
	String maTV;

	
	public String getS_ngayTap() {
		return s_ngayTap;
	}

	public void setS_ngayTap(String s_ngayTap) {
		this.s_ngayTap = s_ngayTap;
	}
	public Date getNgayTap() {
		return Util_Date.stringToDate(getS_ngayTap());
	}
	public String getTimKiemTheo() {
		return timKiemTheo;
	}

	public void setTimKiemTheo(String timKiemTheo) {
		this.timKiemTheo = timKiemTheo;
	}

	public String getTuKhoa() {
		return tuKhoa;
	}

	public void setTuKhoa(String tuKhoa) {
		this.tuKhoa = tuKhoa;
	}

	public String getTenCotTimDoiTuong() {
		return tenCotTimDoiTuong;
	}

	public void setTenCotTimDoiTuong(String tenCotTimDoiTuong) {
		this.tenCotTimDoiTuong = tenCotTimDoiTuong;
	}

	public String getMaObj() {
		return maObj;
	}

	public void setMaObj(String maObj) {
		this.maObj = maObj;
	}

	

	public String getMaTV() {
		return maTV;
	}

	public void setMaTV(String maTV) {
		this.maTV = maTV;
	}
	
	public ThanhVien getThanhVien() {
		ObjectDAO dao_thanhVien = new DAO_ThanhVien();
		ArrayList<ThanhVien> list_thanhVien = dao_thanhVien.listByColumns(maTV, getMaTV());
		if(list_thanhVien.size()>0)
			return list_thanhVien.get(0);
		else
			return null;
		}

	@Override
	public String addNew() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("mode", "addNew");
		session.setAttribute("p", duongDanTrangView);
		session.setAttribute("msg", null);
		session.setAttribute("obj", null);
		return "SUCCESS";
	}

	@Override
	public String viewDetail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String maobj = request.getParameter("maobj");

		session.setAttribute("mode", "viewDetail");

		ArrayList<LichSuTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String viewDetailAndEdit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("msg", null);

		String maobj = request.getParameter("maobj");
		session.setAttribute("mode", "viewDetailAndEdit");
		ArrayList<LichSuTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String saveOrUpdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		LichSuTap obj = new LichSuTap();
		obj.maLST = getMaLST();
		obj.tenLST = getTenLST();
		obj.ngayTap = getNgayTap();
		obj.thoiGianTap = getThoiGianTap();
		obj.noiDung = getNoiDung();
		obj.thanhVien = getThanhVien();
		obj.thoiGianCapNhat = new Date();
		if (dao.saveOrUpdate(obj)) {
			session.setAttribute("msg", "Cập nhật dữ liệu thành công!");
			session.setAttribute("obj", obj);
			session.setAttribute("mode", "viewDetailAndEdit");
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			session.setAttribute("msg", "Cập nhật dữ liệu thất bại!");
			return "FAIL";
		}
	}

	@Override
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maobj = request.getParameter("maobj");
		LichSuTap obj = new LichSuTap();
		obj.setMaLST(maobj);
		if (dao.delete(obj)) {
			session.setAttribute("msg", "Xóa dữ liệu thành công!");
			session.setAttribute("p", duongDanTrang);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String search() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String column = getTimKiemTheo();
		String key = getTuKhoa();
		ArrayList<LichSuTap> arr = dao.listByColumnLike(column, key);
		session.setAttribute("arr", arr);
		session.setAttribute("checkTimKiem", "true");
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String refresh() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("arr", null);
		session.setAttribute("msg", null);
		session.setAttribute("checkTimKiem", null);
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String importData() {
		// TODO Auto-generated method stub
		return null;
	}
	private HttpServletRequest servletRequest;	
	private HttpServletResponse servletResponse;

	private static HSSFCellStyle createStyleForTitle(HSSFWorkbook workbook) {
		HSSFFont font = workbook.createFont();
		font.setBold(true);
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		style.setAlignment(HorizontalAlignment.CENTER);
		return style;
	}
	@Override
	public String exportData() throws IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Danh sách lịch sử tập");

		HSSFCellStyle style = createStyleForTitle(workbook);

		int rownum = 0;
		Cell cell;
		Row row;

		row = sheet.createRow(rownum);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("DANH SÁCH THÔNG TIN LỊCH SỬ TẬP");
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã lịch sử tập");
		cell.setCellStyle(style);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Tên lịch sử tập");
		cell.setCellStyle(style);

		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Ngày tập");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Thời gian tập");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Nội dung");
		cell.setCellStyle(style);
		
		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Tên thành viên");
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("(1)");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("(2)");
		cell.setCellStyle(style);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("(3)");
		cell.setCellStyle(style);

		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("(4)");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("(5)");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("(6)");
		cell.setCellStyle(style);
		
		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("(7)");
		cell.setCellStyle(style);

		ObjectDAO<LichSuTap> dao = new DAO_LichSuTap();
		ArrayList<LichSuTap> list = dao.listAll();
		int stt = 0;
		for (LichSuTap obj : list) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(obj.maLST);

			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(obj.tenLST);

			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(Util_Date.dateToString2(obj.ngayTap));

			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(obj.thoiGianTap);

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(obj.noiDung);
			
			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(obj.getThanhVien().getTenTV());

		}
		Calendar cld = Calendar.getInstance();
		String nam = cld.get(Calendar.YEAR) + "";
		String fileName = "Ho so lich su tap" + nam + ".xls";
		String filePath = servletRequest.getSession().getServletContext().getRealPath("/").concat("report") + "/"
				+ fileName;
		System.out.println("filePath = " + filePath);
		File file = new File(filePath);
		file.getParentFile().mkdirs();

		FileOutputStream outFile = new FileOutputStream(file);
		workbook.write(outFile);
		System.out.println("Created file: " + file.getAbsolutePath());

		////////////////////////////////////////////////////
		// DOWNLOAD FILE
		////////////////////////////////////////////////////
		ServletDownload dl = new ServletDownload();
		try {
			dl.doGet(servletRequest, servletResponse, filePath, fileName);

		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "SUCCESS";
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	

	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}
//	@Override
//	public void setServletResponse(HttpServletResponse servletResponse) {
//		this.servletResponse = servletResponse;
//
//	}
//
//	@Override
//	public void setServletRequest(HttpServletRequest servletRequest) {
//		this.servletRequest = servletRequest;
//
//	}
}
