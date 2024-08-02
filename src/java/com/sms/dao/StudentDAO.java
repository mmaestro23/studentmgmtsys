/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sms.dao;

import com.sms.model.Student;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;


public class StudentDAO {

    public boolean createStudent(Student student) {
        boolean result = false;
        Session session = FactoryManager.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(student);
        tx.commit();
        session.close();
        result = Boolean.TRUE;
        return result;
    }

    public boolean updateStudent(Student student) {
        boolean result = false;
        Session session = FactoryManager.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(student);
        tx.commit();
        session.close();
        result = Boolean.TRUE;
        return result;
    }

    public List<Student> findAll() {
        Session session = null;
        List<Student> result = new ArrayList<>();
        try {
            session = FactoryManager.getSessionFactory().openSession();
            result = session.createQuery("from Student").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;

    }

    public Student findStudent(String regNo) {
        Session session = null;
        Student result = null;
        try {
            session = FactoryManager.getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(Student.class);
            criteria.add(Restrictions.eq("regNo", regNo));

            result = (Student) criteria.uniqueResult();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }

    public void deleteStudent(Student student) {
        Session session = FactoryManager.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.delete(student);
        tx.commit();
        session.close();
    }

}
