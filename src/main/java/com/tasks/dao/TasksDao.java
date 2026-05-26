package com.tasks.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.tasks.dto.Task;
import com.tasks.dto.User;

public class TasksDao{

	private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("tasks");
	
	private EntityManager getEM() {
		return emf.createEntityManager();
	}
	
	public boolean insertTask(String task_name, String task_desc, LocalDate deadline, User user){
		EntityManager em = getEM();
		EntityTransaction et = em.getTransaction();
		try {
			Task t = new Task();
			t.setTask_name(task_name);
			t.setTask_description(task_desc);
			t.setDeadline(deadline);
			t.setUser(user);
			
			et.begin();
			em.persist(t);
			et.commit();
			return true;
			
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
	
	public boolean updateTask(int task_id, String task_name, String task_desc, LocalDate deadline, User newUser) {
		
		EntityManager em = getEM();
		EntityTransaction et = em.getTransaction();
		
		try {
			Task t = em.find(Task.class, task_id);
			if (t != null) {
				t.setTask_name(task_name);
				t.setTask_description(task_desc);
				t.setDeadline(deadline);
				t.setUser(newUser);
				
				et.begin();
				em.merge(t);
				et.commit();
				return true;
			}else {
				System.out.println("Record Not Found");
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
	
	public boolean deleteTask(int task_id) {
		
		EntityManager em = getEM();
		EntityTransaction et = em.getTransaction();
		
		try {
			
			Task t = em.find(Task.class, task_id);
			if (t != null) {
				
				et.begin();
				em.remove(t);
				et.commit();
				return true;
			} else {
				System.out.println("Record Not Found");
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
	
	public Task fetchTaskById(int task_id) {
	    EntityManager em = getEM();
	    try {
	        TypedQuery<Task> q = em.createQuery(
	            "SELECT t FROM Task t JOIN FETCH t.user WHERE t.task_id = :id",
	            Task.class);
	        q.setParameter("id", task_id);
	        try {
	            return q.getSingleResult();
	        } catch (NoResultException e) {
	            return null;
	        }
	    } finally {
	        em.close();
	    }
	}
	
	public List<Task> fetchTaskByUser(int user_id) {
	    EntityManager em = getEM();
	    try {
	        TypedQuery<Task> q = em.createQuery(
	            "SELECT t FROM Task t JOIN FETCH t.user WHERE t.user.user_id = :uid",
	            Task.class);
	        q.setParameter("uid", user_id);
	        return q.getResultList();
	    } finally {
	        em.close();
	    }
	}
	
	 public List<Task> fetchAllTask() {
	        EntityManager em = getEM();
	        try {
	            TypedQuery<Task> q = em.createQuery(
	                    "select t from Task t join fetch t.user", Task.class);
	            return q.getResultList();
	        } finally {
	            em.close();
	        }
	    }
	
}
