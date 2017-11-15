package com.obs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obs.service.BusinessServiceImpl;
import utils.WebUtils;
import com.obs.domain.User;

public class RegisterServlet extends HttpServlet{




    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            User user = new User();
            user.setAddress(address);
            user.setTel(tel);
            user.setEmail(email);
            user.setId(WebUtils.makeID());
            user.setPassword(password);
            user.setUsername(username);

            BusinessServiceImpl service = new BusinessServiceImpl();
            service.registerUser(user);
            System.out.println(user.getEmail());
            request.setAttribute("message", "registration successful!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);

        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("message", "registration fail!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }

}