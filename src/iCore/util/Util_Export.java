package iCore.util;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;

public class Util_Export {

	public static HSSFCellStyle createStyle(HSSFWorkbook workbook, int size, boolean inDam, boolean gachDuoi, boolean canhGiua,
			boolean dongKhung, boolean toMau) {
		HSSFFont font = workbook.createFont();
		HSSFCellStyle style = workbook.createCellStyle();
		font.setFontName("Times New Roman");
		font.setFontHeightInPoints((short)size);
		if(inDam)
			font.setBold(true);
		if(gachDuoi)
			font.setUnderline(HSSFFont.U_SINGLE);
		if(canhGiua)
			style.setAlignment(HorizontalAlignment.CENTER);
		if(dongKhung){
			style.setBorderBottom(BorderStyle.THIN);
			style.setBorderTop(BorderStyle.THIN);
			style.setBorderLeft(BorderStyle.THIN);
			style.setBorderRight(BorderStyle.THIN);
		}
		if(toMau){
			style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		}
		
		style.setFont(font);
		return style;
	}
	
	
	public static void setMerge(Sheet sheet, int numRow, int untilRow, int numCol, int untilCol, boolean border) {
	    CellRangeAddress cellMerge = new CellRangeAddress(numRow, untilRow, numCol, untilCol);
	    sheet.addMergedRegion(cellMerge);
	    if (border) {
	        setBordersToMergedCells(sheet, cellMerge);
	    }

	}



	public static void setBordersToMergedCells(Sheet sheet, CellRangeAddress rangeAddress) {
	    RegionUtil.setBorderTop(BorderStyle.THIN, rangeAddress, sheet);
	    RegionUtil.setBorderLeft(BorderStyle.THIN, rangeAddress, sheet);
	    RegionUtil.setBorderRight(BorderStyle.THIN, rangeAddress, sheet);
	    RegionUtil.setBorderBottom(BorderStyle.THIN, rangeAddress, sheet);
	}
	
	/*public static void autoSizeColumns(HSSFWorkbook workbook) {
	    int numberOfSheets = workbook.getNumberOfSheets();
	    for (int i = 0; i < numberOfSheets; i++) {
	        Sheet sheet = workbook.getSheetAt(i);
	        if (sheet.getPhysicalNumberOfRows() > 0) {
	            Row row = sheet.getRow(0);
	            Iterator<Cell> cellIterator = row.cellIterator();
	            while (cellIterator.hasNext()) {
	                Cell cell = cellIterator.next();
	                int columnIndex = cell.getColumnIndex();
	                sheet.autoSizeColumn(columnIndex);
	            }
	        }
	    }
	}*/
}
