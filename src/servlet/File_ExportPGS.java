package servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import iCore.model.PhieuGiamSatTV;
import iCore.model.PhieuThu;
import iCore.modelDAO.DAO_PhieuGiamSatTV;
import iCore.modelDAO.DAO_PhieuThu;
import iCore.util.Util_Export;

/**
 * Servlet implementation class File_ExportPGS
 */
@WebServlet("/Servlet_FileExportPGS")
public class File_ExportPGS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public File_ExportPGS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//String maDC = request.getParameter("dungcu");
		//ArrayList<ThiSinh> tss = new DAO_ThiSinh().listByColumns("phieuDangKy.kyThi.maKyThi", maKyThi, "soBaoDanhThi");
		// ten file
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		String dateString = df.format(date);
		String tenFile = "DANH_SACH_PHIEU_GIAM_SAT " + dateString + "".concat(".xls");
		// tao file excel
		HSSFWorkbook myWorkBook = new HSSFWorkbook();
		
		ArrayList<PhieuGiamSatTV>phieugiamsats = new DAO_PhieuGiamSatTV().listAll();
		
		CreateSheet(myWorkBook, phieugiamsats);

		/*
		 * HSSFCellStyle styleConten = Util_Export.createStyle(myWorkBook, 12,
		 * false, false, false, true, false); int rowst = 8; Cell cell; Row row;
		 * for(int i = 0; i< tss.size();i++){ ThiSinh ts = tss.get(i); if(i!=0
		 * && !tss.get(i).getPhongThi().equals(tss.get(i-1).getPhongThi())){
		 * mySheet = myWorkBook.createSheet(); CreateHead(mySheet, myWorkBook);
		 * rowst = 8; } row = mySheet.createRow(rowst);
		 * 
		 * cell = row.createCell(0, CellType.STRING);
		 * cell.setCellValue(rowst-7); cell.setCellStyle(styleConten);
		 * 
		 * cell = row.createCell(1, CellType.STRING);
		 * cell.setCellValue(ts.getSoBaoDanhThi());
		 * cell.setCellStyle(styleConten);
		 * 
		 * cell = row.createCell(2, CellType.STRING);
		 * cell.setCellValue(ts.getPhieuDangKy().getSinhVien().getHo());
		 * cell.setCellStyle(styleConten);
		 * 
		 * cell = row.createCell(3, CellType.STRING);
		 * cell.setCellValue(ts.getPhieuDangKy().getSinhVien().getTen());
		 * cell.setCellStyle(styleConten);
		 * 
		 * cell = row.createCell(4, CellType.STRING); cell.setCellValue("");
		 * cell.setCellStyle(styleConten);
		 * 
		 * cell = row.createCell(5, CellType.STRING); cell.setCellValue("");
		 * cell.setCellStyle(styleConten);
		 * 
		 * cell = row.createCell(6, CellType.STRING); cell.setCellValue("");
		 * cell.setCellStyle(styleConten);
		 * 
		 * cell = row.createCell(7, CellType.STRING);
		 * cell.setCellValue(ts.getPhieuDangKy().getSinhVien().getLop());
		 * cell.setCellStyle(styleConten);
		 * 
		 * mySheet.autoSizeColumn(0); mySheet.autoSizeColumn(1);
		 * mySheet.autoSizeColumn(2); mySheet.autoSizeColumn(3);
		 * mySheet.autoSizeColumn(4); mySheet.autoSizeColumn(5);
		 * mySheet.autoSizeColumn(6); mySheet.autoSizeColumn(7);
		 * 
		 * rowst ++;
		 * 
		 * }
		 */
		// Util_Export.autoSizeColumns(myWorkBook);

		// Xuat file
		ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
		myWorkBook.write(outByteStream);
		byte[] outArray = outByteStream.toByteArray();
		response.setContentType("application/ms-excel");
		response.setContentLength(outArray.length);
		response.setHeader("Expires:", "0"); // eliminates
												// browser caching
		response.setHeader("Content-Disposition", "attachment; filename=" + tenFile);
		ServletOutputStream outStream;

		outStream = response.getOutputStream();

		outStream.write(outArray);
		outStream.flush();
		outStream.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void CreateHead(Sheet mySheet, HSSFWorkbook myWorkBook) {
		Cell cell;
		Row row;
	// phanDau
		HSSFCellStyle o1 = Util_Export.createStyle(myWorkBook, 9, true, false, false, false, false);
		/*HSSFCellStyle o2 = Util_Export.createStyle(myWorkBook, 9, true, false, true, false, false);
		HSSFCellStyle o3 = Util_Export.createStyle(myWorkBook, 9, false, false, false, false, false);
		HSSFCellStyle o4 = Util_Export.createStyle(myWorkBook, 9, true, true, true, false, false);
		HSSFCellStyle o5 = Util_Export.createStyle(myWorkBook, 18, true, false, true, false, false);
		HSSFCellStyle o6 = Util_Export.createStyle(myWorkBook, 11, false, false, true, false, false);*/

	/*	row = mySheet.createRow(0);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("TRƯỜNG ĐẠI HỌC GTVT");
		cell.setCellStyle(o1);
		Util_Export.setMerge(mySheet, 0, 0, 0, 4, false);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM");
		cell.setCellStyle(o2);
		Util_Export.setMerge(mySheet, 0, 0, 5, 7, false);

		row = mySheet.createRow(1);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("PHÂN HIỆU TẠI TP.HCM");
		cell.setCellStyle(o3);
		Util_Export.setMerge(mySheet, 1, 1, 0, 4, false);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Độc lập - Tự do - Hạnh phúc");
		cell.setCellStyle(o4);
		Util_Export.setMerge(mySheet, 1, 1, 5, 7, false);

		row = mySheet.createRow(2);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("        * * * * * * * * *");
		cell.setCellStyle(o3);
		Util_Export.setMerge(mySheet, 2, 2, 0, 7, false);*/

		/*row = mySheet.createRow(0);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("DANH SÁCH DỤNG CỤ");
		cell.setCellStyle(o1);
		Util_Export.setMerge(mySheet, 3, 3, 0, 7, false);*/

		/*row = mySheet.createRow(1);
		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("MÃ MÔN:                MÔN:                  LỚP: ");
		cell.setCellStyle(o6);
		Util_Export.setMerge(mySheet, 4, 4, 0, 7, false);

		row = mySheet.createRow(2);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("NGÀY THI:                 GIỜ THI:                PHÒNG THI:                LẦN THI:  ");
		cell.setCellStyle(o6);
		Util_Export.setMerge(mySheet, 5, 5, 0, 7, false);*/

		// title
		HSSFCellStyle title = Util_Export.createStyle(myWorkBook, 11, true, false, true, true, true);
		row = mySheet.createRow(0);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(title);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã phiếu");
		cell.setCellStyle(title);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Tên phiếu");
		cell.setCellStyle(title);
		
		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Nội dung");
		cell.setCellStyle(title);
		
		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Thành viên sở hữu");
		cell.setCellStyle(title);	
		
		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Nhân viên giám sát");
		cell.setCellStyle(title);
	}
	
	private void CreateSheet(HSSFWorkbook myWorkBook, ArrayList<PhieuGiamSatTV> phieugiamsats) {
			HSSFSheet mySheet = myWorkBook.createSheet();
			CreateHead(mySheet, myWorkBook);
			HSSFCellStyle styleConten = Util_Export.createStyle(myWorkBook, 12, false, false, false, true, false);
			int rowst = 1;
			Cell cell;
			Row row;
			for (int i = 0; i < phieugiamsats.size(); i++) {
				PhieuGiamSatTV pgs = phieugiamsats.get(i);
				
				row = mySheet.createRow(rowst);

				cell = row.createCell(0, CellType.STRING);
				cell.setCellValue(i+1);
				cell.setCellStyle(styleConten);

				cell = row.createCell(1, CellType.STRING);
				cell.setCellValue(pgs.getMaPGS());
				cell.setCellStyle(styleConten);

				cell = row.createCell(2, CellType.STRING);
				cell.setCellValue(pgs.getTenPGS());
				cell.setCellStyle(styleConten);

				cell = row.createCell(3, CellType.STRING);
				cell.setCellValue(pgs.getNoiDung());
				cell.setCellStyle(styleConten);
												
				cell = row.createCell(4, CellType.STRING);
				cell.setCellValue(pgs.getThanhVien().getTenTV());
				cell.setCellStyle(styleConten);
						
				cell = row.createCell(5, CellType.STRING);
				cell.setCellValue(pgs.getNhanVien().getTenNV());
				cell.setCellStyle(styleConten);
				rowst++;

				
			}
			
			mySheet.autoSizeColumn(0);
			mySheet.autoSizeColumn(1);
			mySheet.autoSizeColumn(2);
			mySheet.autoSizeColumn(3);
			mySheet.autoSizeColumn(4);
			mySheet.autoSizeColumn(5);
			/*mySheet.autoSizeColumn(6);
			mySheet.autoSizeColumn(7);*/
		}


	/*private void CreateSheet1(HSSFWorkbook myWorkBook, String maKyThi, ArrayList<String> phongThis) {
		for (String phong : phongThis) {
			HSSFSheet mySheet = myWorkBook.createSheet();
			CreateHead(mySheet, myWorkBook);
			ArrayList<ThiSinh> tss = new DAO_ThiSinh().getDanhSachThiSinhTheoPhong(maKyThi, phong);
			HSSFCellStyle styleConten = Util_Export.createStyle(myWorkBook, 12, false, false, false, true, false);
			int rowst = 8;
			Cell cell;
			Row row;
			for (int i = 0; i < tss.size(); i++) {
				ThiSinh ts = tss.get(i);
				
				row = mySheet.createRow(rowst);

				cell = row.createCell(0, CellType.STRING);
				cell.setCellValue(rowst - 7);
				cell.setCellStyle(styleConten);

				cell = row.createCell(1, CellType.STRING);
				cell.setCellValue(ts.getSoBaoDanhThi());
				cell.setCellStyle(styleConten);

				cell = row.createCell(2, CellType.STRING);
				cell.setCellValue(ts.getPhieuDangKy().getSinhVien().getHo());
				cell.setCellStyle(styleConten);

				cell = row.createCell(3, CellType.STRING);
				cell.setCellValue(ts.getPhieuDangKy().getSinhVien().getTen());
				cell.setCellStyle(styleConten);

				cell = row.createCell(4, CellType.STRING);
				cell.setCellValue("");
				cell.setCellStyle(styleConten);

				cell = row.createCell(5, CellType.STRING);
				cell.setCellValue("");
				cell.setCellStyle(styleConten);

				cell = row.createCell(6, CellType.STRING);
				cell.setCellValue("");
				cell.setCellStyle(styleConten);

				cell = row.createCell(7, CellType.STRING);
				cell.setCellValue(ts.getPhieuDangKy().getSinhVien().getLop());
				cell.setCellStyle(styleConten);

				rowst++;

			}
			
			mySheet.autoSizeColumn(0);
			mySheet.autoSizeColumn(1);
			mySheet.autoSizeColumn(2);
			mySheet.autoSizeColumn(3);
			mySheet.autoSizeColumn(4);
			mySheet.autoSizeColumn(5);
			mySheet.autoSizeColumn(6);
			mySheet.autoSizeColumn(7);
		}
	}*/

}
