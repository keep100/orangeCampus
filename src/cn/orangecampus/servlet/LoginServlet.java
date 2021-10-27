package cn.orangecampus.servlet;

import cn.orangecampus.entity.User;
import cn.orangecampus.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *处理登录业务
 * @author 16321
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        User user= UserRepository.login(username,password);
        if(user!=null){
            HttpSession session=req.getSession();
            session.setAttribute("user",user);
            resp.sendRedirect("index.jsp");
        }
        else{
            req.setAttribute("flag",0);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }
}
