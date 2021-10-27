package cn.orangecampus.servlet;

import cn.orangecampus.entity.User;
import cn.orangecampus.repository.UserRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 16321
 */
@WebServlet("/getOneUser")
public class GetOneUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        User user= UserRepository.getOneUser(userId);
        ObjectMapper mapper=new ObjectMapper();
        String json=mapper.writeValueAsString(user);
        resp.getWriter().write(json);
    }
}
