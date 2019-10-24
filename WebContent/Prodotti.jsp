
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*,Database.*,Servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	ArrayList<Prodotto> prodotti = new ArrayList<>();

	
	prodotti = (ArrayList) request.getAttribute("listaProdotti");
%>

<!DOCTYPE HTML>
<html>

<head>
<title>BlackNoise</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
	
<link rel="stylesheet" type="text/css" href="style/style.css" title="style" />
<link rel="stylesheet" type="text/css" href="style/responsive.css"/>

</head>

<body>
	<section id="main">
		<header>
			<section id="logo">
				<section id="logo_text">
					
					<h1>
						<a href="Index.jsp"><span class="logo_colour"></span></a>
					</h1>
					<h2></h2>
				</section>
				
			</section>
			<section id="menubar">
				<ul id="menu">
					<!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
					<li><a href="index.jsp">Home</a></li>
					<li class="selected"><a href="GetListaProdotti">Prodotti</a></li>
					<li><a href="Registrati.jsp">Registrati</a></li>
					<li><a href="Login.jsp">Login</a></li>
					<li><a href="Carrello.jsp">Carrello</a></li>
					<li><a href="Contatti.jsp">Contatti</a></li>
				</ul>
			</section>
		</header>
		<section id="content_header"></section>
		<section id="site_content">
				<aside>
				
				<p>	Sito per la vendita di Magliette e Accessori<br /></p>
				<p></p>
				<h3>Collegamenti Utili</h3>
				<ul>
					<li><a href="http://www.nico.it/">Nico Moda</a></li>
				</ul>
				<h3>Cerca Prodotto</h3>
				<form id="search" method="get" action="CercaProdottiServlet">
					<p>
						<input class="search" type="text" name="nomeProdotto"
							placeholder="Cerca Prodotto..." /> <input name="search"
							type="image" style="border: 0; margin: 0 0 -9px 5px;"
							src="style/search.png" alt="Search" title="Search" />
					</p>
				</form>
			</aside>
			<section id="content">
				<h2>Prodotti</h2>
				<h3>Cerca un prodotto...</h3>
				<form id="search" method="get" action="CercaProdottiServlet">
					<p>
						<input class="search" type="text" name="nomeProdotto"
							placeholder="Cerca Prodotto..." /> <input name="search"
							type="image" style="border: 0; margin: 0 0 -9px 5px;"
							src="style/search.png" alt="Search" title="Search" />
					</p>
				</form>

				
				<table class="table table-hover">
					<thead class="th-center">
						<tr>
							<th>Foto Prodotto</th>
							<th>Nome</th>
							<th>Prezzo</th>
							<th>Tipo</th>
						</tr>
					</thead>
					<tbody>

						<%
							for (int i = 0; i < prodotti.size(); i++) {
						%>
						<tr>
							<td><img src="style/foto/<%=prodotti.get(i).getPath()%>" width="70" height="70" alt="Img ND"></td>
							<td><%=prodotti.get(i).getNome()%></td>
							<td><%=prodotti.get(i).getPrezzo()%>.00&#8364</td>
							<td><%=prodotti.get(i).getTipo()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				
				
				
			</section>
		</section>
	</section>
	<footer></footer>
	<section id="footer">
			Copyright Black Noise Brand | <a href="AdminLogin.jsp">Accedi come Admin</a>
			<br>Tutti i diritti riservati
	</section>
</body>
</html>
