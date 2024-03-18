package pl.coderslab.users;

import pl.coderslab.utils.User;
import pl.coderslab.utils.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/delete/*")
public class Delete extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= - 1;
        try {
            id = Integer.parseInt(request.getPathInfo().split("/")[1]); // próbuję wyciągnąć id
            UserDao userDao = new UserDao();
            userDao.delete(id);
        } catch (NumberFormatException | ArrayIndexOutOfBoundsException | NullPointerException e) {
            e.printStackTrace();
        }
        finally {
            response.sendRedirect("/user/list");
        }
    }
}
