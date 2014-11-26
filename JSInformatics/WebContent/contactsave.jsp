<%
request.setAttribute("message", "Request successfully sent");
request.getRequestDispatcher("contact.jsp").forward(request, response);
%>