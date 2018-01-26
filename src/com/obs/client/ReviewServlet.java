package com.obs.client;

import com.obs.domain.Book;
import com.obs.service.BusinessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReviewServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        String orderId = req.getParameter("orderId");
        BusinessServiceImpl service = new BusinessServiceImpl();
        Book book = service.findBookByName(bookName);
        System.out.println(book);
        req.setAttribute("book", book);
        req.setAttribute("orderId", orderId);
        req.getRequestDispatcher("/client/bookReview.jsp").forward(req, resp);
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}

