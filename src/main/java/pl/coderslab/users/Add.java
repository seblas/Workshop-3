package pl.coderslab.users;

import pl.coderslab.utils.User;
import pl.coderslab.utils.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/add")
public class Add extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(userName!=null && email!=null && password!=null) {
            UserDao userDao = new UserDao();
            User isUser = userDao.read(email); // sprawdzam czy użytkownik z takim mailem już istnieje
            if(isUser==null) {
                User user = new User(userName, email, password);
                user = userDao.create(user);
                response.sendRedirect("/user/list");
            }
            else {
                request.setAttribute("email", email);
                request.setAttribute("username", userName);
                getServletContext().getRequestDispatcher("/users/adduser.jsp")
                        .forward(request, response);
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/users/adduser.jsp")
                .forward(req, resp);
    }
}
