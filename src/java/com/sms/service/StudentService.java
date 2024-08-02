/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sms.service;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;


public class StudentService extends UnicastRemoteObject implements StudentServiceInterface {

    StudentDAO studentDao = new StudentDAO();

    public StudentService() throws RemoteException {
        super();
    }

    @Override
    public void saveStudent(Student student) throws RemoteException {
        studentDao.createStudent(student);
    }

    @Override
    public void updateStudent(Student student) throws RemoteException {
        studentDao.updateStudent(student);
    }

    @Override
    public List<Student> getStudents() throws RemoteException {
        return studentDao.findAll();
    }

    @Override
    public void deleteStudent(Student student) throws RemoteException {
       studentDao.deleteStudent(student);
    }

    @Override
    public Student getStudent(String regNo) throws RemoteException {
        return studentDao.findStudent(regNo);
    }

}
