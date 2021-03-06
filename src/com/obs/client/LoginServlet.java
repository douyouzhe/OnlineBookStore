package com.obs.client;

import com.obs.domain.User;

import com.obs.service.BusinessServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



//test only
import com.obs.domain.Book;
import com.obs.domain.CartItem;
import com.obs.domain.Cart;

public class LoginServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String action = req.getParameter("action");

        if("Login".equals(action)){
            //super.doPost(req, resp);
            String username = req.getParameter("username");
            String pwd = req.getParameter("password");

            BusinessServiceImpl service = new BusinessServiceImpl();
            User user = service.userLogin(username,pwd);
            if(user==null){
                req.setAttribute("message","Wrong username or password!");
                req.getRequestDispatcher("/message.jsp").forward(req,resp);
                return;
            }
            req.getSession().setAttribute("user",user);
            req.getRequestDispatcher("/index?method=getAll").forward(req,resp);

        }
    }

}