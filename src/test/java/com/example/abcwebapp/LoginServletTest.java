package com.example.abcwebapp;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class LoginServletTest extends Mockito {

    private LoginServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Before
    public void setUp() throws Exception {
        servlet = new LoginServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
        connection = mock(Connection.class);
        preparedStatement = mock(PreparedStatement.class);
        resultSet = mock(ResultSet.class);

        // Inject the mocked connection into the servlet
        servlet.setConnection(connection);

        when(request.getSession()).thenReturn(session);
    }

    @Test
    public void testValidLogin() throws Exception {
        // Mock request parameters
        when(request.getParameter("username")).thenReturn("Pathum");
        when(request.getParameter("password")).thenReturn("123456");

        // Mock the database interaction
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true);
        when(resultSet.getString("role")).thenReturn("admin");


        // Call the servlet's doPost method
        servlet.doPost(request, response);

        // Verify session attributes and redirection
        verify(session).setAttribute("username", "Pathum");
      
        verify(session).setAttribute("userRole", "admin");
        verify(response).sendRedirect("admin_dashboard.jsp");
    }

    @Test
    public void testInvalidLogin() throws Exception {
        // Mock invalid login attempt
        when(request.getParameter("username")).thenReturn("user");
        when(request.getParameter("password")).thenReturn("wrong");

        // Mock the database interaction
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(false);

        // Call the servlet's doPost method
        servlet.doPost(request, response);

        // Verify redirection on failure
        verify(response).sendRedirect("login.jsp?error=invalid");
    }
}
