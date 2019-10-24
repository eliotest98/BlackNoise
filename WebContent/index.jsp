<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*"%>
<%
	Utente utente = (Utente) session.getAttribute("user");

	if (utente != null) {
		response.sendRedirect("Indexlog.jsp");
		// SIMULA LA SESSIONE
		//utente = new Utente("a","a","a","a",true,true);

	} else {

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
<link rel="stylesheet" href="style/responsive.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


<body>
	<section id="main">
		<header>
			<section id="logo">
				<section id="logo_text">
				
					<h1>
						<a href="index.jsp"><img><span class="logo_colour"></span></a>
					</h1>	
					<h2></h2>
				</section>
			</section>
			<section id="menubar">
				<ul id="menu">
					
					<li class="selected"><a href="index.jsp">Home</a></li>
					<li><a href="GetListaProdotti">Prodotti</a></li>
					<li><a href="Registrati.jsp">Registrati</a></li>
					<li><a href="Login.jsp">Login</a></li>
					<li><a href="Carrello.jsp">Carrello</a>
					<li><a href="Contatti.jsp">Contatti</a></li>
				</ul>
			</section>
		</header>
		<section id="site_content">
			<aside>
				
				<p>	Sito per la vendita di Magliette e Accessori<br /></p>
				<p></p>
				<h3>Collegamenti Utili</h3>
				<ul>
					<li><a href="https://www.nico.it/">Nico Moda</a></li>
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
				
				<h1 id="go1">Benvenuto su BlackNoise Shop</h1>
				<p id="block1">
						BlackNoise Shop è stato creato da 
						<a href="#linkvuoto">Testa Elio</a>
				</p>
				
				<h3>Stai cercando un prodotto?</h3>
				<form method="post" action="CercaProdottiServlet" id="search_form">
					<p>
						<input class="search" type="text" name="search_field"
							placeholder="Cerca Prodotto..." /> <input name="search"
							type="image" style="border: 0; margin: 0 0 -9px 5px;"
							src="style/search.png" alt="Search" title="Search" />
					</p>
				</form>
				<script>
					$("#go1").click(function() {
						$("#block1").animate({
							width : "90%"
						}, {
							queue : false,
							duration : 3000
						}).animate({
							fontSize : "24px"
						}, 1000).animate({
							borderRightWidth : "15px"
						}, 1000);
					});
					$("#go2").click(function() {
						$(p).animate({
							width : "90%"
						}, 1000).animate({
							fontSize : "24px"
						}, 1000).animate({
							borderRightWidth : "15px"
						}, 1000);
					});
				</script>
			<script>
$(document).ready(function(){
    $("h5").click(function(){
        $(this).hide();
    });
});
</script>
				
			</section>
		</section>
		<footer></footer>
		<section id="footer">
			Copyright Black Noise Brand | <a href="AdminLogin.jsp">Accedi come Admin</a>
			<br>Tutti i diritti riservati
		</section>
	</section>
</body>
</html>
