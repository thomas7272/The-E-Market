<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;

int z = 0;
try {
    Connection con = ConnectionProvider.getCon();
    
    // Use PreparedStatement to avoid SQL injection
    PreparedStatement pst1 = con.prepareStatement("SELECT * FROM product WHERE id = ?");
    pst1.setString(1, product_id);
    ResultSet rs = pst1.executeQuery();
    
    while (rs.next()) {
        product_price = rs.getInt(4);
        product_total = product_price;
    }
    
    PreparedStatement pst2 = con.prepareStatement("SELECT * FROM cart WHERE product_id = ? AND email = ? AND address IS NULL");
    pst2.setString(1, product_id);
    pst2.setString(2, email);
    ResultSet rs1 = pst2.executeQuery();
    
    while (rs1.next()) {
        cart_total = rs1.getInt(5);
        cart_total = cart_total + product_total;
        quantity = rs1.getInt(3);
        quantity = quantity + 1;
        z = 1;
    }
    
    if (z == 1) {
        // Update the cart using a prepared statement
        PreparedStatement pst3 = con.prepareStatement("UPDATE cart SET total = ?, quantity = ? WHERE product_id = ? AND email = ? AND address IS NULL");
        pst3.setInt(1, cart_total);
        pst3.setInt(2, quantity);
        pst3.setString(3, product_id);
        pst3.setString(4, email);
        pst3.executeUpdate();
        response.sendRedirect("home.jsp?msg=exist");
    }
    
    if (z == 0) {
        // Insert into the cart using a prepared statement
        PreparedStatement ps = con.prepareStatement("INSERT INTO cart (email, product_id, quantity, price, total) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, email);
        ps.setString(2, product_id);
        ps.setInt(3, quantity);
        ps.setInt(4, product_price);
        ps.setInt(5, product_total);
        ps.executeUpdate();
        response.sendRedirect("home.jsp?msg=added");
    }
    
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("home.jsp?msg=invalid");
}
%>
