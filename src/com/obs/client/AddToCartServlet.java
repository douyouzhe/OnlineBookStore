package com.obs.client;

import com.obs.domain.Book;
import com.obs.domain.Cart;
import com.obs.service.BusinessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AddToCartServlet extends HttpServlet{




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String bookId = req.getParameter("bookId");
            BusinessServiceImpl service = new BusinessServiceImpl();
            Book book = service.findBook(bookId);
            Cart cart = (Cart)req.getSession().getAttribute("cart");
            if(cart ==null){
                cart = new Cart();
                req.getSession().setAttribute("cart",cart);
            }
            service.addBooktoCart(cart,book);
            req.getRequestDispatcher("/client/addedToCart.jsp").forward(req,resp);


        }catch(Exception e){
            e.printStackTrace();
            req.setAttribute("message", "Something Went Wrong, please try again");
            req.getRequestDispatcher("/message.jsp").forward(req,resp);
        }
    }
}
