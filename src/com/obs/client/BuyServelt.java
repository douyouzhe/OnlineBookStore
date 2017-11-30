package com.obs.client;

import com.obs.domain.Cart;
import com.obs.domain.User;
import com.obs.service.BusinessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BuyServelt extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            User user = (User) req.getSession().getAttribute("user");
            if(user==null){
                req.setAttribute("message","You have not logged in");
                req.getRequestDispatcher("/message.jsp").forward(req,resp);
                return;
            }
            else{
                Cart cart = (Cart)req.getSession().getAttribute("cart");
                BusinessServiceImpl service = new BusinessServiceImpl();
                service.createOrder(cart,user);
                req.setAttribute("message","Thank you for shopping with us!");
                req.getSession().removeAttribute("cart");
                req.getRequestDispatcher("/message.jsp").forward(req,resp);
            }

        }catch (Exception e){
            e.printStackTrace();
            req.setAttribute("message","Something went wrong, please try again!");
            req.getRequestDispatcher("/message.jsp").forward(req,resp);
        }
    }
}
