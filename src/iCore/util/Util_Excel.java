package iCore.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

public class Util_Excel {
	public static int getColumnsCount(HSSFSheet xssfSheet) {
		int result = 0;
		Iterator<Row> rowIterator = xssfSheet.iterator();
		while (rowIterator.hasNext()) {
			Row row = rowIterator.next();
			List<Cell> cells = new ArrayList<>();
			Iterator<Cell> cellIterator = row.cellIterator();
			while (cellIterator.hasNext()) {
				cells.add(cellIterator.next());
			}
			for (int i = cells.size(); i > 0; i--) {
				Cell cell = cells.get(i - 1);
				if (cell.toString().trim().isEmpty()) {
					cells.remove(i - 1);
				} else {
					result = cells.size() > result ? cells.size() : result;
					break;
				}
			}
		}
		System.out.println("getColumnsCount = " + result);
		return result;
	}
}
