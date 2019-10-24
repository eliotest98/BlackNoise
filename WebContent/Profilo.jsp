 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*,Database.*,Servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Utente utente = (Utente) session.getAttribute("user");
	int count = 0;
	if (utente != null) {
		count = (Integer) session.getAttribute("carrello");

	} else {
		response.sendRedirect("Login.jsp");
	}
	//String email = utente.getEmail();
	//Utente u = DatabaseQuery.getUtenteByID(email);

	
%>

<!DOCTYPE HTML>
<html>

<head>
<title>Profilo: <%=utente.getEmail()%>
</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
<link rel="stylesheet" type="text/css" href="style/responsive.css" />

</head>

<body>
	<section id="main">
		<header>
			<section id="logo">
				<section id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="indexLog.jsp"><span class="logo_colour"></span></a>
					</h1>
					<h2></h2>
				</section>
				
			</section>
			<section id="menubar">
				<ul id="menu">
					<!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
					<li><a href="Indexlog.jsp">Home</a></li>
					<li><a href="GetListaProdottiLog">Prodotti</a></li>
					<li class="selected"><a href="Profilo.jsp">Profilo</a></li>
					<li><a href="Logout.jsp">Logout</a></li>
					<li><a href="CarrelloLog.jsp">Carrello</a></li>
				</ul>
			</section>
		</header>
		<section id="content_header"></section>
		<section id="site_content">
			<aside>
				<h3>
					Ciao
					<%=utente.getNome()%>
					<%=utente.getCognome()%></h3>
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
				<h3>
					Ciao
					<%=utente.getNome()%>, ecco il tuo profilo...
				</h3>
				<br>
				<p>
					<span>Nome: </span>
					<%=utente.getNome()%>
				</p>
				<br>
				<p>
					<span>Cognome: </span>
					<%=utente.getCognome()%>
				</p>
				<br>
				<p>
					<span>Sesso: </span>
					<%=utente.getSesso()%>
				</p>
				<br>
				<p>
					<span>Email:</span>
					<%=utente.getEmail()%>
				</p>
				<br>
				<p>
					<span>Password: </span>
					<%=utente.getPassword()%>
				</p>
			</section>

			</form>

			<form action="GetListaOrdiniUtente" method="get">
				<section class="form_settings">
					<br>
					<p style="padding-top: 20px">
						<span>&nbsp;</span><input class="insert" type="submit"
							name="contact_submitted" value="I miei ordini" />
					</p>
				</section>
			</form>

			<form action="EliminaSelfUtente" method="get">
				<section class="form_settings">
					<br>
					<p style="padding-top: 20px">
						<span>&nbsp;</span><input class="submit" type="submit"
							name="contact_submitted" value="Elimina Account" />
					</p>
				</section>
			</form>
		</section>
	</section>
	<footer></footer>
	<section id="footer">
		Copyright Black Noise Brand | Tutti i diritti riservati  
	</section>
</body>
</html>
