package cn.orangecampus.servlet;

import cn.orangecampus.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 16321
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String tel=req.getParameter("tel");
        if(UserRepository.nameIsExist(username)){
            String isExist="true";
            resp.getWriter().write(isExist);
        }
        if(UserRepository.register(username,password,tel)!=0){
            req.setAttribute("register_success","注册成功");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }
}
