package Controller;

import Model.Author;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


@WebServlet(urlPatterns = "/getList")
public class AuthorServlet extends javax.servlet.http.HttpServlet {
    protected Connection getConnection() {
        Connection conn = null;
        try {
            conn = DBConnection.initializeDatabase();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Connection conn = getConnection();
        if (request.getParameter("add") != null) {
            try {
                String name = request.getParameter("name");
                String dob = request.getParameter("dob");
                PreparedStatement ps = conn.prepareStatement("insert into Author(name,dateOfBirth) values(?,?)");
                ps.setString(1, name);
                ps.setString(2, dob);
                ps.executeUpdate();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("edit") != null) {
            try {
                int id = Integer.parseInt(request.getParameter("authorId"));
                String name = request.getParameter("name");
                String dob = request.getParameter("dob");
                PreparedStatement ps = conn.prepareStatement("update Author set name=?,dateOfBirth=? where id=?");
                ps.setString(1, name);
                ps.setString(2, dob);
                ps.setInt(3, id);
                ps.executeUpdate();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("getList?");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Connection conn = getConnection();
        if (request.getParameter("idDelete") != null) {
            int id = Integer.parseInt(request.getParameter("idDelete"));
            try {
                PreparedStatement ps = conn.prepareStatement("delete from Author where id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
                ps.close();
                response.sendRedirect("getList?");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("idEdit") != null) {
            try {
                PreparedStatement ps = conn.prepareStatement("select * from Author where id=?");
                ps.setInt(1, Integer.parseInt(request.getParameter("idEdit")));
                ResultSet rs = ps.executeQuery();
                Author newAuthor = new Author();
                while (rs.next()) {
                    newAuthor.setId(rs.getInt(1));
                    newAuthor.setName(rs.getString(2));
                    newAuthor.setDob(rs.getDate(3));
                }
                rs.close();
                ps.close();
                request.setAttribute("selectedAuthor", newAuthor);
                request.getRequestDispatcher("EditAuthorInfoForm.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            ArrayList<Author> list = new ArrayList<>();
            try {
                String querry = "Select * from Author";
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(querry);
                while (rs.next()) {
                    Author newAuthor = new Author();
                    newAuthor.setId(rs.getInt(1));
                    newAuthor.setName(rs.getString(2));
                    newAuthor.setDob(rs.getDate(3));
                    list.add(newAuthor);
                }
                rs.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("authorList", list);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }


}
