package pl.coderslab.users;

import pl.coderslab.utils.User;
import pl.coderslab.utils.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/show/*")
public class Show extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= - 1;
        UserDao userDao = new UserDao();
        User user = null;
        try {
            id = Integer.parseInt(request.getPathInfo().split("/")[1]); // próbuję wyciągnąć id
            user = userDao.read(id);
            request.setAttribute("user", user);
            getServletContext().getRequestDispatcher("/users/showuser.jsp")
                    .forward(request, response);
        } catch (NumberFormatException | ArrayIndexOutOfBoundsException | NullPointerException e) { // te błędy mi wyskoczyły podczas testów
            e.printStackTrace();
            response.sendRedirect("/user/list");
        }
    }
}
