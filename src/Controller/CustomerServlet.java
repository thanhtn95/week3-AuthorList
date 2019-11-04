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
public class CustomerServlet extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Connection conn = null;
        try {
            conn = DBConnection.initializeDatabase();
        } catch (Exception e) {
            e.printStackTrace();
        }

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
