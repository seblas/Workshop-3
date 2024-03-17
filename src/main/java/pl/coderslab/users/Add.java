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
            User user = new User(userName, email, password);
        //    user.setUserName("Sebastian");
        //    user.setEmail("seblas17@tlen.pl");
        //    user.setPassword("hasło");
            UserDao userDao = new UserDao();
            user = userDao.create(user);
        }
        response.sendRedirect("/user/list");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/users/adduser.jsp")
                .forward(req, resp);
    }
}
