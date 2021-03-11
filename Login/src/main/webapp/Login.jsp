<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaibhav", "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where username='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userid", "username");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='Index.jsp'>try again</a>");
    }
%>