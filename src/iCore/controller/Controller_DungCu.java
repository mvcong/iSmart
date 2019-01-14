package iCore.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import iCore.model.NhanVien;
import iCore.modelDAO.DAO_DungCu;
import iCore.modelDAO.DAO_LichSuTap;
import iCore.modelDAO.DAO_NhanVien;
import iCore.util.Util_Date;
import servlet.ServletDownload;

public class Controller_DungCu extends DungCu implements ZEController {
	ObjectDAO dao = new DAO_DungCu();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/dungcus.jsp";
	String duongDanTrangView = "iCore/pages/dungcu.jsp";
	String tenCotTimDoiTuong = "maDC";
	String maObj;
	String s_ngayNhap;
	String maNV;
	
	
	File excel_myFile;
	String excel_myFileContentType;
	String excel_myFileFileName;
	String excel_myFileName;
	String myFolder_iCore;

	String tenDC;

	
	public File getExcel_myFile() {
		return excel_myFile;
	}

	public void setExcel_myFile(File excel_myFile) {
		this.excel_myFile = excel_myFile;
	}

	public String getExcel_myFileContentType() {
		return excel_myFileContentType;
	}

	public void setExcel_myFileContentType(String excel_myFileContentType) {
		this.excel_myFileContentType = excel_myFileContentType;
	}

	public String getExcel_myFileFileName() {
		return excel_myFileFileName;
	}

	public void setExcel_myFileFileName(String excel_myFileFileName) {
		this.excel_myFileFileName = excel_myFileFileName;
	}

	public String getExcel_myFileName() {
		return excel_myFileName;
	}

	public void setExcel_myFileName(String excel_myFileName) {
		this.excel_myFileName = excel_myFileName;
	}

	public String getMyFolder_iCore() {
		return myFolder_iCore;
	}

	public void setMyFolder_iCore(String myFolder_iCore) {
		this.myFolder_iCore = myFolder_iCore;
	}

	public String getTenDC() {
		return tenDC;
	}

	public void setTenDC(String tenDC) {
		this.tenDC = tenDC;
	}

	public String getS_ngayNhap() {
		return s_ngayNhap;
	}

	public void setS_ngayNhap(String s_ngayNhap) {
		this.s_ngayNhap = s_ngayNhap;
	}

	public Date getNgayNhap() {
		return Util_Date.stringToDate(getS_ngayNhap());
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

	public String getMaNV() {
		return maNV;
	}

	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}

	public NhanVien getNhanVien() {
		ObjectDAO dao_nhanVien = new DAO_NhanVien();
		ArrayList<NhanVien> list_nhanVien = dao_nhanVien.listByColumns("maNV", getMaNV());
		if (list_nhanVien.size() > 0)
			return list_nhanVien.get(0);
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

		ArrayList<DungCu> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<DungCu> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		DungCu obj = new DungCu();
		obj.maDC = getMaDC();
		obj.tenDC = getTenDC();
		obj.loaiDC = getLoaiDC();
		obj.ngayNhap = getNgayNhap();
		obj.soLuong = getSoLuong();
		obj.hsd = getHsd();
		obj.giaMua = getGiaMua();
		obj.nhanVien = getNhanVien();
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
		DungCu obj = new DungCu();
		obj.setMaDC(maobj);
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
		ArrayList<DungCu> arr = dao.listByColumnLike(column, key);
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
		HSSFSheet sheet = workbook.createSheet("Danh sách dụng cụ");

		HSSFCellStyle style = createStyleForTitle(workbook);

		int rownum = 0;
		Cell cell;
		Row row;

		row = sheet.createRow(rownum);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("DANH SÁCH THÔNG TIN DỤNG CỤ");
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã dụng cụ");
		cell.setCellStyle(style);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Tên dụng cụ");
		cell.setCellStyle(style);

		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Loại dụng cụ");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Ngày nhập");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Số lượng");
		cell.setCellStyle(style);
		
		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Hạn sử dụng");
		cell.setCellStyle(style);
		
		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Giá mua");
		cell.setCellStyle(style);
		
		cell = row.createCell(8, CellType.STRING);
		cell.setCellValue("Tên nhân viên");
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
		
		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("(8)");
		cell.setCellStyle(style);
		
		cell = row.createCell(8, CellType.STRING);
		cell.setCellValue("(9)");
		cell.setCellStyle(style);

		ObjectDAO<DungCu> dao = new DAO_DungCu();
		ArrayList<DungCu> list = dao.listAll();
		int stt = 0;
		for (DungCu obj : list) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(obj.maDC);

			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(obj.tenDC);

			cell = row.createCell(3 , CellType.STRING);
			cell.setCellValue(obj.loaiDC);
 
			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(Util_Date.dateToString2(obj.ngayNhap));

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(obj.soLuong);

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(obj.hsd);
			
			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(obj.giaMua);
			
			cell = row.createCell(8, CellType.STRING);
			cell.setCellValue(obj.getNhanVien().getTenNV());

		}
		Calendar cld = Calendar.getInstance();
		String nam = cld.get(Calendar.YEAR) + "";
		String fileName = "Ho so dung cu" + nam + ".xls";
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

}
