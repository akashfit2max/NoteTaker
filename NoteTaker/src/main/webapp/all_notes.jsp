<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes: Notetaker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				/* creating a query object to fetch data */
				Query q = s.createQuery("from Note");
				List<Note> notes = q.list();
				for (Note note : notes) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width: 80px" src="img/post-it.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<div class="container text-center mt-2">
						
						<p><b class="text-primary" ><%=note.getDate() %></b></p>
							<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger m-2">Delete</a> <a
								href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
						</div>

					</div>
				</div>
				<%
				}
				s.close();
				%>
			</div>
		</div>



	</div>

</body>
</html>