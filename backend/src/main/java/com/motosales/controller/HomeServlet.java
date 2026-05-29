package com.motosales.controller;

import com.motosales.dao.MotorcycleDao;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeServlet", urlPatterns = {"/", "/home"})
public class HomeServlet extends HttpServlet {
    private final MotorcycleDao motorcycleDao = new MotorcycleDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("featuredMotorcycles", motorcycleDao.findFeatured());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (SQLException ex) {
            throw new ServletException("Cannot load homepage motorcycles", ex);
        }
    }
}
