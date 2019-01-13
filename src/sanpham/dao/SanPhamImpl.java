package sanpham.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import iCore.dao.HibernateUtil;
import sanpham.model.SanPham;

public class SanPhamImpl implements SanPhamInterface{

	@SuppressWarnings("unchecked")
	@Override
	public List<SanPham> getListSanPham() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<SanPham> list = null;
		try {
			transaction = session.beginTransaction();
			list = session.createQuery("FROM sanpham").list();
			transaction.commit();
		} catch (HibernateException e) {
			if(transaction!=null)
			transaction.rollback();
			e.printStackTrace();
//			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

}
