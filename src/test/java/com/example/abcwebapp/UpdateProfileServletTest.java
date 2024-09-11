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
public class UpdateProfileServletTest {

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
        when(request.getSession()).thenReturn(session);  // Ensure session is returned when getSession() is called
        when(session.getAttribute("userId")).thenReturn(1);

        // Create a new instance of the UpdateProfileServlet class
        UpdateProfileServlet servlet = new UpdateProfileServlet();

        // Call the doPost method
        servlet.doPost(request, response);

        // Verify that the user profile was updated
        verify(response).sendRedirect("customer_dashboard.jsp");
    }
}
