package com.obs.client;

import com.obs.domain.Cart;
import com.obs.domain.CartItem;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class DeleteItemServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String bookId = req.getParameter("bookId");
        Cart cart = (Cart)req.getSession().getAttribute("cart");
        Map<String,CartItem> map = cart.getMap();
        map.remove(bookId);
        req.getSession().setAttribute("cart",cart);
        req.getRequestDispatcher("/client/listCart.jsp").forward(req,resp);

    }
}
