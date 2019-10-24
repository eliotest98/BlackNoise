
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*,Database.*,Servlet.*, java.math.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	
	Utente utente = (Utente) session.getAttribute("user");
	String email = null;
	ArrayList<Carrello> lista = new ArrayList<>();
	ArrayList<Prodotto> prod = new ArrayList<>();
	int count = 0;
	if (utente != null) {
		
		email = utente.getEmail();
		lista = DatabaseQuery.getCarrello(email);

		System.out.println(lista);

		for (int i = 0; i < lista.size(); i++) {
			Prodotto p = DatabaseQuery.getProdotto(lista.get(i).getIdProdotto());
			prod.add(p);
		}

		count = (Integer) session.getAttribute("carrello");

	} else {

		response.sendRedirect("Login.jsp");
	}
	int a =0;
	for(int i=0;i<prod.size();i++){
		a = prod.get(i).getIdProdotto();
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

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/validationacq.js"></script>
</head>

<body>
	<section id="main">
		<header>
			<section id="logo">
				<section id="logo_text">
					
					<h1>
						<a href="Indexlog.jsp"><span class="logo_colour"></span></a>
					</h1>
					<h2></h2>
				</section>
				
			</section>
			<section id="menubar">
				<ul id="menu">
					<!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
					<li><a href="Indexlog.jsp">Home</a></li>
					<li><a href="GetListaProdottiLog">Prodotti</a></li>
					<li><a href="Profilo.jsp">Profilo</a></li>
					<li><a href="Logout.jsp">Logout</a></li>
					<li class="selected"><a href="CarrelloLog.jsp">Carrello</a></li>
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
			
				<h2>
					Ciao
					<%=utente.getNome()%>, ecco i prodotti che hai aggiunto al
					carrello...
				</h2>

				<%
					if (prod.size() != 0) {
				%>
				<table class="table table-hover">
					<thead class="th-center">
						<tr>
							<th>Foto</th>
							<th>idProdotto</th>
							<th>Nome</th>
							<th>Prezzo</th>
							<th>Tipo</th>
							<th>Quantità</th>
						</tr>
					</thead>
					<tbody>
							<form id="insertform" action="AcquistaProdottoServlet" method="post">
							<%
							for (int i = 0;i<prod.size(); i++) {
							%>
							<tr>
							<td><img width="70" height="70" src="style/foto/<%=prod.get(i).getPath()%>" alt="Img ND"></td>
							<td><%=prod.get(i).getIdProdotto()%></td>
							<td><%=prod.get(i).getNome()%></td>
							<td><%=prod.get(i).getPrezzo()%></td>
							<td><%=prod.get(i).getTipo()%></td>
							<td><input class="contact" type="number" min="1" max="10" name="prod" placeholder="1-10"></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
					<section class="form_settings">
						<br>
						<p>
							<span><strong>Pagamento</strong></span>
							    <br>
							    <br>
								<span>Paypal</span><input class="contact" type="radio"
								name="pagamento" value="Paypal">
								<span>MasterCard</span><input class="contact" type="radio"
								name="pagamento" value="MasterCard">
								<span>Maestro</span><input class="contact" type="radio"
								name="pagamento" value="Maestro" />
								<span>Visa</span><input class="contact" type="radio"
								name="pagamento" value="Visa" />
								<span>Postepay</span><input class="contact" type="radio"
								name="pagamento" value="Postepay" />
						</p>
						<br>
						<p>
							<span>Indirizzo</span><input class="contact" type="text"
								name="indirizzo" value=""  />
						</p>
						<br>
						<p>
							<span>Note</span><textarea placeholder="" class="contact textarea" name="descrizione" ></textarea>
						</p>
						<br>
							<input class="concat" type="hidden" value="<%= a %>" name="id_p">
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="insert" type="submit"
								name="contact_submitted" value="Acquista Prodotti" />
						</p>
					</section>
					</form>

				<form id="insertform" action="SvuotaCarrelloServlet" method="post">
					<section class="form_settings">
						<br>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="insert" type="submit"
								name="contact_submitted" value="Svuota Carrello" />
						</p>
					</section>
				</form>
				<%
					} else {
				%>
				<h4>Non hai prodotti nel carrello...</h4>
				<%
					}
				%>
			</section>
		</section>
		<footer></footer>
		<section id="footer">
		Copyright Black Noise Brand | Tutti i diritti riservati
	</section>
	</section>
</body>
</html>
