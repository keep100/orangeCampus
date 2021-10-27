package cn.orangecampus.servlet;

import cn.orangecampus.entity.Cart;
import cn.orangecampus.repository.CartRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author 16321
 */
@WebServlet("/getCartRecord")
public class GetCartRecordsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        List<Cart>cartList= CartRepository.getCartList(userId);
        ObjectMapper mapper=new ObjectMapper();
        StringBuilder sb=new StringBuilder();
        for(Cart item:cartList){
            sb.append(mapper.writeValueAsString(item));
            sb.append("#");
        }
        sb.deleteCharAt(sb.length()-1);
        resp.getWriter().write(sb.toString());
    }
}
