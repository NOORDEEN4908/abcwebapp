package com.example.abcwebapp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class QueryServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private HttpSession session;

    @Test
    public void testDoPost() throws Exception {
        // Set up mock objects
        when(request.getParameter("name")).thenReturn("John Doe");
        when(request.getParameter("email")).thenReturn("johndoe@example.com");
        when(request.getParameter("query")).thenReturn("How do I use this app?");
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("userId")).thenReturn(1);

        // Create a new instance of the QueryServlet class
        QueryServlet servlet = new QueryServlet();

        // Call the doPost method
        servlet.doPost(request, response);

        // Verify that the query was inserted into the database
        // You can add more verifications or assertions as needed
        verify(response).sendRedirect("customer_dashboard.jsp");
    }
}