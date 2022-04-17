package cn.orangecampus.servlet;

import cn.orangecampus.entity.Cart;
import cn.orangecampus.entity.User;
import cn.orangecampus.repository.BuyRecordRepository;
import cn.orangecampus.repository.CartRepository;
import cn.orangecampus.repository.UserRepository;
import cn.orangecampus.utils.SendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 16321
 */
@WebServlet("/delAll")
public class DelAllCartRecordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        String buyFlag=req.getParameter("buyFlag");
        if(buyFlag.equals("true")){
            try {
                User user= UserRepository.getOneUser(userId);
                SendMail.sendMail("你已购买成功，商品已经发货，请注意查收",user.getEmail());
                List<Cart>cartList=new ArrayList<>();
                cartList=CartRepository.getCartList(userId);
                for(Cart item:cartList){
                    BuyRecordRepository.addBuyRecord(item.getUserId(), item.getGoodsId());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        CartRepository.delAllRecord(userId);
        resp.sendRedirect("myCart.jsp");
    }
}
