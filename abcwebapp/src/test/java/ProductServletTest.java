import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.abcwebapp.ProductServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductServletTest {

    @InjectMocks
    private ProductServlet productServlet;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private Connection mockConnection;

    @Mock
    private PreparedStatement mockStatement;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testDoPostValidProduct() throws Exception {
        // Set up valid parameters
        when(request.getParameter("name")).thenReturn("Pizza");
        when(request.getParameter("description")).thenReturn("Tasty Pizza");
        when(request.getParameter("price")).thenReturn("9.99");
        when(request.getParameter("imageUrl")).thenReturn("images/pizza.png");

        // Mock database connection and query execution
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockStatement);
        when(mockStatement.executeUpdate()).thenReturn(1);  // Simulate success

        productServlet.doPost(request, response);

        // Verify redirect to success page
        verify(response).sendRedirect("product_success.jsp");
    }

    @Test
    public void testDoPostInvalidPrice() throws Exception {
        // Set up invalid price parameter
        when(request.getParameter("name")).thenReturn("Pizza");
        when(request.getParameter("description")).thenReturn("Tasty Pizza");
        when(request.getParameter("price")).thenReturn("invalid_price");
        when(request.getParameter("imageUrl")).thenReturn("images/pizza.png");

        productServlet.doPost(request, response);

        // Verify redirect to error page due to invalid price
        verify(response).sendRedirect("error.jsp");
    }

    @Test
    public void testDoPostDatabaseError() throws Exception {
        // Set up valid parameters
        when(request.getParameter("name")).thenReturn("Pizza");
        when(request.getParameter("description")).thenReturn("Tasty Pizza");
        when(request.getParameter("price")).thenReturn("9.99");
        when(request.getParameter("imageUrl")).thenReturn("images/pizza.png");

        // Mock database connection throwing SQLException
        when(mockConnection.prepareStatement(anyString())).thenThrow(new SQLException());

        productServlet.doPost(request, response);

        
    }
}
