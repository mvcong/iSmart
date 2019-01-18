package iCore.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import iCore.model.TheThanhVien;

public class TheTVDAOImpl implements TheTVDAO {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	@Override
	public void dangKyThang(TheThanhVien ttv) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(ttv);
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
	public void dangKyNgay(TheThanhVien ttv) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(ttv);
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
	public TheThanhVien getTheThanhVien(String maThe) {
		// TODO Auto-generated method stub
		return null;
	}

}
