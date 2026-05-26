package com.tasks.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.tasks.dto.User;

public class UserDao {

	private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("tasks");

	private EntityManager getEM() {
		return emf.createEntityManager();
	}

	public boolean register(String name, String username, String email, String password) {

		EntityManager em = getEM();
		EntityTransaction et = em.getTransaction();

		try {

			Query q = em.createQuery("select u from User u where u.email = ?1 or u.username = ?2");
			q.setParameter(1, email);
			q.setParameter(2, username);
			List<User> users = q.getResultList();
			if (users.isEmpty()) {

				User u = new User();
				u.setName(name);
				u.setUsername(username);
				u.setEmail(email);
				u.setPassword(password);

				et.begin();
				em.persist(u);
				et.commit();

				return true;
			} else {
				System.out.println("User Already Registered");
				return false;
			}

		} catch (Exception e) {
			// TODO: handle exception
			if (et.isActive()) {
				et.rollback();
			}
			e.printStackTrace();
			return false;
		} finally {
			em.close();
		}
	}

	public User login(String username, String password) {

		EntityManager em = getEM();

		try {
			TypedQuery<User> q = em.createQuery("Select u from User u where u.username = ?1 and u.password = ?2",
					User.class);
			q.setParameter(1, username);
			q.setParameter(2, password);

			return q.getSingleResult();

		} catch (NoResultException e) {
			// TODO: handle exception
			return null;
		} finally {
			em.close();
		}
	}

	public List<User> fetchAllUser() {
		EntityManager em = getEM();
		try {
			return em.createQuery("select u from User u", User.class).getResultList();
		} finally {
			em.close();
		}
	}

	public User fetchUserById(int user_id) {
		EntityManager em = getEM();
		try {
			return em.find(User.class, user_id);
		} finally {
			em.close();
		}
	}

}
