<!DOCTYPE HTML>
<html>

<head>
<title>BlackNoise Shop - Errore</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" /><link rel="stylesheet" type="text/css" href="style/responsive.css"/>
	
</head>

<body>
	<section id="main">
		<header>
			<section id="logo">
				<section id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="index.jsp"><span class="logo_colour"></span></a>
					</h1>
					<h2></h2>
				</section>
				
			</section>
			<section id="menubar">
				<ul id="menu">
					<!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
					<li><a href="index.jsp">Home</a></li>
					<li><a href="GetListaProdotti">Prodotti</a></li>
					<li class="selected"><a href="Registrati.jsp">Registrati</a></li>
					<li><a href="Login.jsp">Login</a></li>
					<li><a href="Carrello.jsp">Carrello</a></li>
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
				<!-- insert the page content here -->
				<h1>Registrati</h1>

				<form action="RegistrazioneServlet" method="post">
					<section class="form_settings">
						<br>
						<p>
							<span>Email</span><input class="contact" type="email"
								name="user_email" value="" />
						</p>
						<br>
						<p>
							<span>Nome</span><input class="contact" type="text"
								name="user_nome" value="" />
						</p>
						<br>
						<p>
							<span>Cognome</span><input class="contact" type="text"
								name="user_cognome" value="" />
						</p>
						<br>
						<p>
							<span>Password</span><input class="contact" type="password"
								name="user_password" value="" />
						</p>
						<br>
						<p>
							<span>Conferma Password</span><input class="contact"
								type="password" name="user_confpassword" value="" />
						</p>
						<br>
						<p>Sesso:</p>

						<p>
							<span>Uomo</span><input class="contact" type="radio"
								name="user_sesso" value="u" />
						</p>
						<p>
							<span>Donna</span><input class="contact" type="radio"
								name="user_sesso" value="d" />
						</p>

					
						<p>
							<span>Foto</span><input class="contact" type="text"
								name="user_foto" value="" />
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Conferma" />
						</p>
					</section>
				</form>

			</section>
		</section>
		<footer></footer>
		<section id="footer">
			Copyright Black Noise Brand | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a
				href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a
				href="AdminLogin.jsp">Accedi come Admin</a>
		</section>
	</section>
</body>
</html>
