package iCore.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DAO {

	public static List listAll(String tableName) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			list = session.createQuery("from " + tableName).list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	public static boolean saveOrUpdate(Object object) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.saveOrUpdate(object);
			transaction.commit();
			session.close();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			session.close();
			return false;
		}
	}

	public static boolean delete(Object object) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.delete(object);
			transaction.commit();
			session.close();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			session.close();
			return false;
		}
	}

	public static List listByColumn(String tableName, String columnName, String value) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from " + tableName + " c where c." + columnName + "=:id");
			query.setString("id", value);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	public static List listByColumnLike(String tableName, String columnName, String value) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from " + tableName + " c where c." + columnName + " like :id");
			query.setString("id", "%" + value + "%");
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	public static List listByObject(String tableName, String columnName, String value) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from " + tableName + " c where c." + columnName + "=:id");
			query.setString("id", value);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	public static List listByColumnNotEmty(String tableName, String columnName) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from " + tableName + " c where c." + columnName + "<>''");
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	public static List listByQuery(String query2) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(query2);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	public static List pagination(String tableName, long maxResult, long firstResult) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from " + tableName + " as c order by c.thoiGianCapNhat desc");
			query.setFirstResult((int) firstResult);
			query.setMaxResults((int) maxResult);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	// Ho Van Bi - 30/5/2018
	public static List pagination(String query2, String tableName, long maxResult, long firstResult) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List list = new ArrayList();
		try {
			transaction = session.beginTransaction();
			// Query query = session.createQuery(query2);
			Query query = session.createQuery(
					"from " + tableName + " as c" + " where " + query2 + " order by c.thoiGianCapNhat desc");
			query.setFirstResult((int) firstResult);
			query.setMaxResults((int) maxResult);
			list = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

	public static long count(String tableName) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		long result = 0;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("select count(*) from " + tableName);
			String s = query.list().toString();
			result = Long.parseLong(s.substring(1, s.indexOf("]")));
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
		return result;
	}
}
