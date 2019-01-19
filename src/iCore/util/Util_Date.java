package iCore.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import java.text.SimpleDateFormat;
import java.util.Date;;

public class Util_Date {
	public static Date convertDate(java.util.Date date) {
		if (date != null) {
			return new Date(date.getYear(), date.getMonth(), date.getDate());
		} else
			return null;

	}

	public static String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	public static String dateToString2(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		return sdf.format(date);
	}

	public static Date stringToDate(String s) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return (Date) sdf.parse(s);
		} catch (Exception e) {
			return new Date();
		}
	}

	public static void main(String[] args) {
		Date d = new Date();
		System.out.println(dateToString(d));
	}
}