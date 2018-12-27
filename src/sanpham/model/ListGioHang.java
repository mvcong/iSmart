package sanpham.model;

import java.util.ArrayList;

import iCore.model.GioHang;

public class ListGioHang {
	private ArrayList listAll = new ArrayList();
	private long tongTien;

	public int getSoLuongTrongGio() {
		return listAll.size();
	}

	public void xoaSoLuongSanPhamTrongGio(String strItemIndex) {
		int iItemIndex = 0;
		try {
			iItemIndex = Integer.parseInt(strItemIndex);
			listAll.remove(iItemIndex - 1);
			tongGiaTriTrongGio();
		} catch (NumberFormatException nfe) {
			System.out.println("Error while deleting cart item: " + nfe.getMessage());
			nfe.printStackTrace();
		}
	}

	public void updateSoLuongSanPhamTrongGio(String strItemIndex, String strSoLuong) {
		long lThanhTien = 0;
		long lGiaSP = 0;
		int soLuong = 0;
		int iItemIndex = 0;
		GioHang gioHang = null;
		try {
			iItemIndex = Integer.parseInt(strItemIndex);
			soLuong = Integer.parseInt(strSoLuong);
			if (soLuong > 0) {
				gioHang = (GioHang) listAll.get(iItemIndex - 1);
				lGiaSP = gioHang.getGiaSP();
				lThanhTien = lGiaSP * soLuong;
				gioHang.setSoLuong(soLuong);
				gioHang.setThanhTien(lThanhTien);
				tongGiaTriTrongGio();
			}
		} catch (NumberFormatException nfe) {
			System.out.println("Error while updating cart: " + nfe.getMessage());
			nfe.printStackTrace();
		}

	}

	public void themSanPhamVaoGio(String strTenSP, String strSoLuong, String strGiaSP, String strThanhTien) {
		long lThanhTien = 0;
		long lGiaSP = 0;
		int soLuong = 0;
		GioHang gioHang = new GioHang();
		try {
			lGiaSP = Long.parseLong(strGiaSP);
			soLuong = Integer.parseInt(strSoLuong);
			if (soLuong > 0) {
				lThanhTien = lGiaSP * soLuong;
				gioHang.setTenSP(strTenSP);
				gioHang.setSoLuong(soLuong);
				gioHang.setGiaSP(lGiaSP);
				gioHang.setThanhTien(lThanhTien);
				listAll.add(gioHang);
				tongGiaTriTrongGio();
			}

		} catch (NumberFormatException nfe) {
			System.out.println("Error while parsing from String to primitive types: " + nfe.getMessage());
			nfe.printStackTrace();
		}
	}
	
	 public void themSanPhamVaoGio(GioHang gioHang) {
		 listAll.add(gioHang);
	    }

	    public GioHang getGioHang(int iItemIndex) {
	    	GioHang gioHang = null;
	        if (listAll.size() > iItemIndex) {
	        	gioHang = (GioHang) listAll.get(iItemIndex);
	        }
	        return gioHang;
	    }

	public ArrayList getListAll() {
		return listAll;
	}

	public void setListAll(ArrayList listAll) {
		this.listAll = listAll;
	}

	public long getTongTien() {
		return tongTien;
	}

	public void setTongTien(long tongTien) {
		this.tongTien = tongTien;
	}

	protected void tongGiaTriTrongGio() {
		long dblTotal = 0;
		for (int counter = 0; counter < listAll.size(); counter++) {
			GioHang gioHang = (GioHang) listAll.get(counter);
			dblTotal += gioHang.getThanhTien();

		}
		setTongTien(dblTotal);
	}
}
