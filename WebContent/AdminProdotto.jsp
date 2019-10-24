<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*,Database.*,Servlet.*"%>

<%
	Admin admin = (Admin) session.getAttribute("admin");

	if (admin != null) {
		// SIMULA LA SESSIONE
		//utente = new Utente("a","a","a","a",true,true);

	} else {
		response.sendRedirect("index.jsp");
	}

	ArrayList<Prodotto> prodotti = new ArrayList<>();

	String visible = "visible";
	prodotti = DatabaseQuery.getProdotti();

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
	<link rel="stylesheet" type="text/css" href="style/responsive.css"/>
	
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>

<!--  Controlla se un bottone è stato cliccato o meno e passa il valore submit -->

</head>

<body>
	<section id="main">
		<header>
			<section id="logo">
				<section id="logo_text">
					<h1>
						<a href="index.html"><span class="logo_colour"></span></a>
					</h1>
					<h2></h2>
				</section>
			</section>
			<section id="menubar">
				<ul id="menu">
					<li><a href="index.jsp">Logout</a></li>
					<li class="selected"><a href="AdminProdotto.jsp">Prodotti</a></li>
					<li><a href="AdminUtenti.jsp">Utenti</a></li>
				</ul>
			</section>
		</header>
		<section id="content_header"></section>
		<section id="site_content">
			<section id="content">
				<h2>Funzionalità Aggiuntive...</h2>
				
				<h4><a
			href="AddProdotto.jsp">AGGIUNGI PRODOTTO</a></h4>
				
				<h3>Elimina Prodotti</h3>
				<%
					if (visible == "visible") {
				%>
				<table class="table table-hover">
					<thead class="th-center">
						<tr>
							<th>Foto</th>
							<th>Nome</th>
							<th>Prezzo</th>
							<th>Quantità</th>
							<th>Tipo</th>
							<th>Elimina dal Database</th>
						</tr>
					</thead>
					<tbody>

						<%
							//int [] itera;
								//itera = new int [100];

								for (int i = 0; i < prodotti.size(); i++) {

									//itera[i] = prodotti.get(i).getIdProdotto();
						%>
						<form action="EliminaProdottoServlet" method="get">
						<tr>
							<td><img width="100" height="100"
								src="style/foto/<%=prodotti.get(i).getPath()%>" alt="Img ND"></td>
							<input size="3" name="prodott" type="hidden" value="<%=prodotti.get(i).getIdProdotto()%>"/>
							<td><%=prodotti.get(i).getNome()%></td>
							<td><%=prodotti.get(i).getPrezzo()%>.00&#8364</td>
							<td><%=prodotti.get(i).getQuantità()%></td>
							<td><%=prodotti.get(i).getTipo()%></td>
							<td><input type="image" id="addcarr" name="submitta"
								value="addcarr" src="style/cestino.png" /></td>
						</tr>
						</form>
						<%
							}
						%>
					</tbody>
				</table>
				<%
					} else if (visible == "nulla") {
				%>
				<h3>La ricerca non ha prodotto risultati...</h3>
				<%
					} else {
				%>
				<h4>Effettua una ricerca...</h4>
				<%
				
				
					}
				%>
			</section>
		</section>
	</section>
	<footer></footer>
	<section id="footer">
		Copyright Black Noise Brand | Tutti i diritti riservati
	</section>

</body>
</html>
