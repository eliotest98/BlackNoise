<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,Beans.*,Database.*,Servlet.*"%>
	
<%	
	int ivacorrente = 22;
	int a=0;
	Utente utente = (Utente) session.getAttribute("user");
	ArrayList<Ordine> ordine = new ArrayList<Ordine>();
	ArrayList<Prodotto> prodotto = new ArrayList<Prodotto>();
	String visible = null;
	String idUtente = null;
	String x = "T-Shirt Black Noise";
	String y = "Cappellino Black Noise";
	int quan = 3;
	int quantot = 0; 
	int tot =0;
	BigDecimal tota=new BigDecimal(0);
	int count = 0;
	if (utente != null) 
	{
		a=a+1;
		ordine = (ArrayList) request.getAttribute("lista");
		prodotto = (ArrayList) request.getAttribute("lista2");
		System.out.println(ordine);
		System.out.println(prodotto);
		visible = (String) request.getAttribute("vis");
		idUtente = utente.getEmail();
		count = (Integer) session.getAttribute("carrello");
	} 
	else {
	response.sendRedirect("index.jsp");
	}

	for(int i=0;i<ordine.size();i++)
	{
		BigDecimal j = ordine.get(i).getPrezzo(); 
		tota = tota.add(j).multiply(new BigDecimal(quan));
		quantot = quantot + quan; 
		tot=tot+1;
	}
	for(int g =0;g<prodotto.size();g++)
	{
		quan = 100 - (prodotto.get(g).getQuantità());
	}
	BigDecimal iva = tota.multiply(new BigDecimal(ivacorrente).divide(new BigDecimal(100)));
	BigDecimal totale=tota.add(iva);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fattura</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
<link rel="stylesheet" type="text/css" href="style/responsive.css" />

<script type="text/javascript" src="js/jquery-3.1.1.js"></script>

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
						<table class="c">
						<tr  class="c">
						<th class="c">
						BlackNoise SNC;<br>
						P.IVA 01294370486<br>
						<br>
						Via Circumvallazione 56 83030 AVELLINO(AV)<br>
						Tel. 08231245679 Cel. 3496858082<br>
						E-mail:
						<%
						for(int i=0;i<1;i++){
						%> 
						<%= ordine.get(i).getIdUtente() %>
						<%} %>
						</th>
						<th class="c">
						<br><br><br><br>
						Spett.le<br>
						<%=utente.getNome()%>
						<%=utente.getCognome()%><br><br>
						<% for(int i=0;i<1;i++){ %>
						<%= ordine.get(i).getIndirizzo() %>
						<%} %>
						</th>
						<th rowspan="2"colspan="4" class="c"><img src="style/logoPagina.png" width="270" height="170"><br></th>
						</tr>
						<tr class="c">
						<td class="c">
						Fattura n <%= a %><br>
						<br>
						Data: <% for(int i=0;i<1;i++){ %>
						<!--<%=ordine.get(i).getData()%>-->
						<% Calendar calendar = new GregorianCalendar(); 
						int anno = calendar.get(Calendar.YEAR);
						int mese = calendar.get(Calendar.MONTH);
						int giorno = calendar.get(Calendar.DATE);
						GregorianCalendar data = new GregorianCalendar(anno,mese,giorno);
						%>
						<%= data.getTime() %>
						<%} %>
						</td>
						<td class="c">Pagamento : <% for(int i=0;i<1;i++){ %>
						<%= ordine.get(i).getPagamento() %>
						<%} %>
						<br>
						<br>
						Banca Appoggio: Intesa San Paolo
						</td>
						</tr>
						<tr class="c">
						<td class="c">Codice</td>
						<td class="c">Descrizione</td>
						<td class="c">Iva</td>
						<td class="c">Quantità</td>
						<td class="c">Prezzo Singolo</td>
						<td class="c">Prezzo Totale</td>
						</tr>
						<%for(int i=0;i<ordine.size();i++){ %>
						<tr>
						<td class="c"><%= ordine.get(i).getIdOrdine() %></td>
						<td class="c"><% if(ordine.get(i).getIdProdotto() == 1 & ordine.get(i).getIdProdotto()== 3 & ordine.get(i).getIdProdotto()== 5)
											{%>
												<%= x %>
											<%}
											else{%>
												<%= y %>
											<%}
											%>
						</td>
						<td class="c"><%= ivacorrente%>&#37</td>
						<td class="c"><%= quan%></td>
						<td class="c"><%= ordine.get(i).getPrezzo() %>.00&#8364 </td>
						<td class="c"><%= ordine.get(i).getPrezzo().multiply(new BigDecimal(quan))%>.00&#8364 </td>
						</tr>
						<%} %>
						<tr class="c">
						<td class="vuoto" colspan="4" style="background-color:white"></td>
						<td class="c">Imponibile:</td>
						<td class="c"><%= tota %>.00&#8364</td>
						</tr>
						<td class="vuoto" colspan="4" style="background-color:white"></td>
						<td class="c" width="90">Calcolo Iva:</td>
						<td class="c"><%= iva %>&#8364</td>
						<tr>
						<tr class="c">
						<td class="vuoto" colspan="2" style="background-color:white"></td>
						<td class="c">Quantità Totale:</td>
						<td class="c"><%=quantot%></td>
						<td class="c">Totale Fattura:</td>
						<td class="c"><%=totale%>&#8364</td>
						</tr>
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
