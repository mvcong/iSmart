package iCore.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import iCore.dao.DAO;;
public abstract class ObjectDAO<T> {

	public String table;

	public ObjectDAO() {
	}

	public ObjectDAO(String table) {
		this.table = table;
	}

	public ArrayList<T> listAll() {
		List list = DAO.listAll(table);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public ArrayList<T> listByID(String id) {
		List list = DAO.listByColumn(table, "ID", id);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public ArrayList<T> listByColumns(String tenColumn, String value) {
		List list = DAO.listByColumn(table, tenColumn, value);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public ArrayList<T> listByColumnLike(String tenColumn, String value) {
		List list = DAO.listByColumnLike(table, tenColumn, value);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public ArrayList<T> listByNotEmty(String tenColumn) {
		List list = DAO.listByColumnNotEmty(table, tenColumn);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public ArrayList<T> listByQuery(String query2) {
		List list = DAO.listByQuery(query2);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public boolean saveOrUpdate(T object) {
		return DAO.saveOrUpdate(object);
	}

	public boolean delete(T object) {
		return DAO.delete(object);
	}

	// Ho Van Bi - 30/5/2018
	public ArrayList<T> pagination(String query, long maxResult, long firstResult) {
		List list = DAO.pagination(query, table,  maxResult, firstResult);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public ArrayList<T> pagination(long maxResult, long firstResult) {
		List list = DAO.pagination(table, maxResult, firstResult);
		ArrayList<T> result = new ArrayList<>();
		for (Object object : list) {
			result.add((T) object);
		}
		return result;
	}

	public long count() {
		long result = DAO.count(table);
		return result;
	}
}
