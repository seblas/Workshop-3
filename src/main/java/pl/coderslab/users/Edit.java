package pl.coderslab.users;

import pl.coderslab.utils.User;
import pl.coderslab.utils.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/edit/*")
public class Edit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int id = Integer.parseInt(request.getParameter("id"));
        UserDao userDao = new UserDao();
        User isUser = userDao.read(email); // sprawdzam czy użytkownik z takim mailem już istnieje
        if(isUser==null) {
            try {
                User user = new User(id, userName, email, password);
                userDao.update(user);
            } catch (RuntimeException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/user/list");
        }
        else {
            User user = userDao.read(id); // jeżeli taki mail już istnieje to znowu pobieram User i wysyłam ponownie do formularza, ale tym razem razem z atrybutem email
            request.setAttribute("user", user);
            request.setAttribute("email", email);
            getServletContext().getRequestDispatcher("/users/edituser.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = -1;
        UserDao userDao = new UserDao();
        User user = null;

        try {
            id = Integer.parseInt(req.getPathInfo().split("/")[1]); // próbuję wyciągnąć id
            user = userDao.read(id);
        } catch (NumberFormatException | ArrayIndexOutOfBoundsException | NullPointerException e) {
            e.printStackTrace();
        }

        if(user != null) {
            req.setAttribute("user", user);
            getServletContext().getRequestDispatcher("/users/edituser.jsp")
                    .forward(req, resp);
        } else {
            resp.sendRedirect("/user/list");
        }
    }
}
