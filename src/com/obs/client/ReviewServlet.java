package com.obs.client;

import com.obs.domain.Book;
import com.obs.domain.Review;
import com.obs.domain.User;
import com.obs.service.BusinessServiceImpl;
import utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReviewServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String bookName = req.getParameter("bookName");
        String orderId = req.getParameter("orderId");
        User user = (User) req.getSession().getAttribute("user");
        BusinessServiceImpl service = new BusinessServiceImpl();
        Book book = service.findBookByName(bookName);
        System.out.println(service.checkReview(book.getId(),user.getId()));
        if(service.checkReview(book.getId(),user.getId())) {
            req.setAttribute("book", book);
            req.setAttribute("orderId", orderId);
            req.getRequestDispatcher("/client/bookReview.jsp").forward(req, resp);
        }else
        {
            String msg = "Sorry, you have written a review for this book";
            req.setAttribute("message", msg);
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookId = req.getParameter("book_id");
        User user = (User) req.getSession().getAttribute("user");
        String userId = user.getId();
        String score = req.getParameter("score");
        String feedback = req.getParameter("review");
        Review review = new Review();
        review.setId(WebUtils.makeID());
        review.setBook_id(bookId);
        review.setUser_id(userId);
        review.setScore(Integer.parseInt(score));
        review.setFeedback(feedback);


        BusinessServiceImpl service = new BusinessServiceImpl();
        service.submitReview(review);
        String msg = "Thank you for your review";
        req.setAttribute("message", msg);
        req.getRequestDispatcher("/message.jsp").forward(req, resp);

    }
}

