
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*,Database.*,Servlet.*"%>

<%
	Utente utente = (Utente) session.getAttribute("user");
	String visible = null;
	int count = 0;
	ArrayList<Prodotto> prodotti = new ArrayList<>();
	if (utente != null) {

	
		prodotti = (ArrayList) request.getAttribute("listaProdotti");

		String idUtente = utente.getEmail();

		count = (Integer) session.getAttribute("carrello");

	} else {
		response.sendRedirect("index.jsp");
	}
%>

<!DOCTYPE HTML>
<html>

<head>
<title>BlackNoise</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
<link rel="stylesheet" type="text/css" href="style/responsive.css" />

<script type="text/javascript" src="js/jquery-3.1.1.js"></script>

<!--  Controlla se un bottone è stato cliccato o meno e passa il valore submit -->

</head>

<body>
	<section id="main">
		<header>
			<section id="logo">
				<section id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="index.html"><span class="logo_colour"></span></a>
					</h1>
					<h2></h2>
				</section>
				
			</section>
			<section id="menubar">
				<ul id="menu">
					<!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
					<li><a href="Indexlog.jsp">Home</a></li>
					<li class="selected"><a href="GetListaProdottiLog">Prodotti</a></li>
					<li><a href="Profilo.jsp">Profilo</a></li>
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
				<h2>Prodotti</h2>
				<h3>Cerca Prodotto</h3>
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
							<th>Foto</th>
							<th>Nome</th>
							<th>Prezzo</th>
							<th>Tipo</th>
							<th>Aggiungi a Carrello</th>
						</tr>
					</thead>
					<tbody>

						<%
							//int [] itera;
								//itera = new int [100];

								for (int i = 0; i < prodotti.size(); i++) {

									//itera[i] = prodotti.get(i).getIdProdotto();
						%>
						<form action="AddCarrelloServlet" method="get">
							<tr>
								<td><img width="100" height="100"
									src="style/foto/<%=prodotti.get(i).getPath()%>" alt="Img ND"></td>
								<input size="3" name="prodott" type="hidden"
									value="<%=prodotti.get(i).getIdProdotto()%>" />
								<td><%=prodotti.get(i).getNome()%></td>
								<td><%=prodotti.get(i).getPrezzo()%>.00&#8364</td>
								<td><%=prodotti.get(i).getTipo()%></td>
								<td><input type="image" id="addcarr" name="submitta"
									value="addcarr" src="style/carrello.png" /></td>
							</tr>
						</form>
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
		Copyright Black Noise Brand | Tutti i diritti riservati
	</section>

</body>
</html>
