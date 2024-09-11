package com.example.abcwebapp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class AddStaffServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;

    @Test
    public void testDoPost() throws Exception {
        // Set up mock objects
        when(request.getParameter("name")).thenReturn("John Doe");
        when(request.getParameter("email")).thenReturn("johndoe@example.com");
        when(request.getParameter("role")).thenReturn("admin");
        when(request.getParameter("password")).thenReturn("password123");

        // Create a new instance of the AddStaffServlet class
        AddStaffServlet servlet = new AddStaffServlet();

        // Call the doPost method
        servlet.doPost(request, response);

        // Verify that the user was inserted into the database
        // You can add more verifications or assertions as needed
        verify(response).sendRedirect("admin_dashboard.jsp");
    }
}