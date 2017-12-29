package com.obs.client;

import com.obs.domain.Book;
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
import java.util.Map;
import java.util.Set;

public class UserProfileServlet extends HttpServlet{


    private void listOrders(HttpServletRequest req,HttpServletResponse resp)
            throws ServletException,IOException{
        BusinessServiceImpl service = new BusinessServiceImpl();
        String orderId= req.getParameter("orderId");
        Map<String,Integer> ls= service.getAllBook(orderId);
        System.out.print(ls.size());
        req.setAttribute("BookList",ls);
        User user = (User) req.getSession().getAttribute("user");
        req.setAttribute("username", user.getUsername());
        req.setAttribute("address", user.getAddress());
        req.setAttribute("tel", user.getTel());
        req.setAttribute("email", user.getEmail());
        req.setAttribute("id", user.getId());
        service = new BusinessServiceImpl();
        List<Order> order;
        order = service.listOrderForUser(user.getId());
        req.setAttribute("order", order);
        req.getRequestDispatcher("client/userProfile.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method=req.getParameter("method");
        if(method.equals("displayUserInfo")){
            displayUserInfo(req,resp);
        }
        else if(method.equals("displayOrderInfo")){
            listOrders(req,resp);
        }

    }

    private void displayUserInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user != null) {
            req.setAttribute("username", user.getUsername());
            req.setAttribute("address", user.getAddress());
            req.setAttribute("tel", user.getTel());
            req.setAttribute("email", user.getEmail());
            req.setAttribute("id", user.getId());
            BusinessServiceImpl service = new BusinessServiceImpl();
            List<Order> order;
            order = service.listOrderForUser(user.getId());
            req.setAttribute("order", order);
            req.getRequestDispatcher("client/userProfile.jsp").forward(req, resp);
        } else {
            req.setAttribute("message", "Log in first!");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
        }
    }

}
