package iCore.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import iCore.model.ThanhVien;

@SuppressWarnings("unused")
public class TVDAOImpl implements TVDAO {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void themTV(ThanhVien tv) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(tv);
			tx.commit();
		} catch (HibernateException e) {
			if(tx!= null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}

	}

	@Override
	public ThanhVien getThanhVien(int maTV) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		ThanhVien tv = null;
		try {
			tx = session.beginTransaction();
			tv = (ThanhVien) session.createQuery("FROM thanhvien WHERE maTV='"+maTV+"'").uniqueResult();
			tx.commit();
		} catch (HibernateException e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return tv;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkEmail(String email) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List<ThanhVien> tv = null;
		try {
			tx = session.beginTransaction();
			tv = session.createQuery("FROM thanhvien WHERE email='"+email+"'").list();
			tx.commit();
			if(tv.size()>=1) {
				return true;
			}
		} catch (HibernateException e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return false;
	}

}
