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
@WebServlet("/findPwd")
public class FindPwdServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tel=req.getParameter("tel");
        String password= UserRepository.findPwd(tel);
        resp.getWriter().write(password);
    }
}
