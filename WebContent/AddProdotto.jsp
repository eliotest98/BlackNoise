
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*"%>
<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin != null) {
	// SIMULA LA SESSIONE
	
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
	<link rel="stylesheet" type="text/css" href="style/responsive.css"/>
	
	<!--Ultima versione di jQuery (minified) -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- Ultima versione di jquery.validate (minfied) -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/validationprod.js"></script>
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
				
				<h1><br><b>Aggiungi un prodotto</b></br></h1>

				<form id="insertform" action="AddProdottoServlet" method="post">
					<section class="form_settings">
						<br>
						<p>
							<span><b>Nome</b></span><input class="contact" type="text"
								name="prodotto_nome" value="" />
						</p>
						<br>
						<p>
							<span><b>Tipo:</b></span><br>
							<br>
							<span>Tshirt</span><input class="contact" type="radio"
								name="prodotto_tipo" value="Tshirt" />
								<span>Accessorio</span><input class="contact" type="radio"
								name="prodotto_tipo" value="Accessorio" />
								 
						</p>
						<br>
						<p>
							<span><b>Descrizione</b></span>
							<textarea class="contact textarea" rows="8" cols="40"
								name="prodotto_descrizione"></textarea>
						</p>
						<br>
						<p>
							<span><b>Quantità</b> </span><input class="contact" type="number"
								min="1" max="100" name="prodotto_quantita" value="" placeholder="1-100"/>
						</p>
						<br>
						<p>
							<span><b>Prezzo</b></span><input class="contact" type=number step=0.01
								name="prodotto_prezzo" value="" placeholder="x.xx"/>
						</p>
						<br>
						<p>
							<span><b>Link Immagine</b></span><input class="contact" type="text"
								placeholder="Cappello1.jpg" name="prodotto_path" value="" />
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="insert" type="submit"
								name="contact_submitted" value="Inserisci Prodotto" />
						</p>
				</form>
				<form id="insertform" action="AdminProdotto.jsp" method="post">
				<span>&nbsp;</span><input class="insert" type="submit" name="contact_submitted" value="Torna ai Prodotti" />
				</form>
			</section>
		</section>
		<footer></footer>
		<section id="footer">
			Copyright Black Noise Brand | Tutti i diritti riservati
				
		</section>
	</section>
</body>
</html>
