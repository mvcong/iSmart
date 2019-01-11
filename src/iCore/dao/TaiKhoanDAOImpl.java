package iCore.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import iCore.model.TaiKhoan;
import iCore.model.ThanhVien;

public class TaiKhoanDAOImpl implements TaiKhoanDAO {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void themTK(TaiKhoan tk) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(tk);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	@Override
	public TaiKhoan getTaiKhoan(String maDangNhap) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		TaiKhoan tk = null;
		try {
			tx = session.beginTransaction();
			tk = (TaiKhoan) session.createQuery("FROM taikhoan WHERE maDangNhap='" + maDangNhap + "'").uniqueResult();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return tk;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkMaDangNhap(String maDangNhap) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<TaiKhoan> tk = null;
		try {
			tx = session.beginTransaction();
			tk = session.createQuery("FROM taikhoan WHERE maDangNhap='" + maDangNhap + "'").list();
			tx.commit();
			if (tk.size() >= 1) {
				return true;
			}
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

}
