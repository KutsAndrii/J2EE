/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.springinjections;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 *
 * @author kutss
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3311/university";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            PrintWriter pw = response.getWriter();

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace(pw);
                pw.print(ex.getMessage());
            }

            String sqlQuery = "INSERT INTO `student`(`name`, `surname`, `email`, `group_`, `faculty`) VALUES (?, ?, ?, ?, ?)";
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                con.setAutoCommit(true);

                if (request.getParameter("name") != null && request.getParameter("surname") != null) {
                    PreparedStatement ps = con.prepareStatement(sqlQuery);
                    ps.setString(1, request.getParameter("name"));
                    ps.setString(2, request.getParameter("surname"));
                    ps.setString(3, request.getParameter("email"));
                    ps.setString(4, request.getParameter("group_"));
                    ps.setString(5, request.getParameter("faculty"));
                    ps.executeUpdate();
                }

                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM `student`");
                List<Student> students = new LinkedList<>();

                while (rs.next()) {
                    Student student = (Student) getBean("student");
                    student.setId(rs.getInt(1));
                    student.setName(rs.getString(2));
                    student.setSurname(rs.getString(3));
                    student.setEmail(rs.getString(4));
                    student.setGroup_name(rs.getString(5));
                    student.setFaculty(rs.getString(6));
                    students.add(student);
                }

                session.setAttribute("students", students);
                response.sendRedirect("Student.jsp");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Object getBean(String beanName) {
        ApplicationContext factory = new ClassPathXmlApplicationContext("spring.xml");
        return factory.getBean(beanName);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
