package com.example.abcwebapp;

import java.io.IOException;
import com.example.abcwebapp.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorldServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the content type to HTML
        response.setContentType("text/html");

        // Write the HTML content to the response
        response.getWriter().println("<html>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h2>Hello Worldsss!</h2>");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }
}
