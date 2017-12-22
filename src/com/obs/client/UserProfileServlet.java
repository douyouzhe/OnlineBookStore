package com.obs.client;

import com.obs.domain.Order;
import com.obs.domain.OrderItem;
import com.obs.domain.User;
import com.obs.service.BusinessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class UserProfileServlet extends HttpServlet{


    private void listOrders(HttpServletRequest req,HttpServletResponse resp)
            throws ServletException,IOException{
        BusinessServiceImpl service = new BusinessServiceImpl();
        String orderId= req.getParameter("orderId");
        List<Order> orders;
        Order theOrder = new Order();
        User user = (User) req.getSession().getAttribute("user");
        orders = service.listOrderForUser(user.getId());

        for(Order order:orders){
            if (order.getId().equals(orderId)){
                theOrder = order;
            }
        }


        Set<OrderItem> orderItemSet = theOrder.getOrderItems();
        req.setAttribute("theOrder",theOrder);
        req.getRequestDispatcher("client/userProfile.jsp").forward(req,resp);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if(user!=null){
            req.setAttribute("username",user.getUsername());
            req.setAttribute("address",user.getAddress());
            req.setAttribute("tel",user.getTel());
            req.setAttribute("email",user.getEmail());
            req.setAttribute("id",user.getId());

            BusinessServiceImpl service = new BusinessServiceImpl();
            List<Order> order;
            order = service.listOrderForUser(user.getId());
            //System.out.println(order.toString());
            req.setAttribute("order",order);


            req.getRequestDispatcher("client/userProfile.jsp").forward(req,resp);
        }
        else{
            req.setAttribute("message","Log in first!");
            req.getRequestDispatcher("/message.jsp").forward(req,resp);
        }
    }
}
