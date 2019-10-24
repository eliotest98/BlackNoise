package Database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Beans.Admin;
import Beans.Carrello;
import Beans.Ordine;
import Beans.Prodotto;
import Beans.Utente;


public class DatabaseQuery {

	/**
	 * Query gestione Utente
	 */
	private static String queryAddUtente;
	private static String queryEliminaUtente;
	private static String queryGetUtente;
	private static String queryCambiaPassword;
	
	/*
	 * Query gestione Prodotti 
	 */
	private static String queryAddProdotto;
	private static String queryEliminaProdotto;
	private static String queryGetProdotti;
	private static String queryCercaProdotto;
	private static String queryGetProdottoById;
	private static String queryGetProdottoByUser;
	private static String queryGetNumeroProdotto;
	
	/*
	 * Query gestione Ordini e Carrello
	 */
	private static String queryAddOrdine;
	private static String queryGetMieiOrdini;
	private static String queryOrdini;
	private static String queryAddCarrello;
	private static String queryGetCarrello;
	private static String queryGetMieiOrdiniById;
	private static String queryGetProdottiById;
	private static String queryEliminaCarrello;
	private static String queryUpdateQuantit�;
	/*
	 * Query Gestione Admin
	 */
	private static String queryGetUtenti;
	private static String queryGetAdmin;
	
	/*
	 * ArrayList per le query
	 */
	private static ArrayList listProdotti;
	private static ArrayList<Prodotto> cercaProdotti;
	private static ArrayList listCarrello;
	private static ArrayList listProdCarrello;
	private static ArrayList listOrdini;
	private static ArrayList utenti;
	private static ArrayList ordini;

	/**
	 * aggiunge un utente nel database
	 */
	public synchronized static boolean addUser(Utente utente) throws SQLException{
		Connection connection = null;
		PreparedStatement psAddUtente = null;

		try{
			connection = Database.getConnection();
			psAddUtente = connection.prepareStatement(queryAddUtente);

			psAddUtente.setString(1, utente.getEmail());
			psAddUtente.setString(2, utente.getNome());
			psAddUtente.setString(3, utente.getCognome());
			psAddUtente.setString(4, utente.getPassword());
			psAddUtente.setString(5, utente.getSesso());
			psAddUtente.setString(6, utente.getFoto());

			System.out.println(psAddUtente.toString());

			psAddUtente.executeUpdate();

			connection.commit();
			System.out.println("GU Connessione...");
		} finally {
			try{
				if(psAddUtente != null)
					psAddUtente.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}

	/**
	 * Elimina un utente dal database
	 */
	public synchronized static boolean delUser(String email) throws SQLException{
		Connection connection = null;
		PreparedStatement psDelUtente = null;

		try{
			connection = Database.getConnection();
			psDelUtente = connection.prepareStatement(queryEliminaUtente);
			psDelUtente.setString(1, email);
			System.out.println(psDelUtente);
			psDelUtente.executeUpdate();

			connection.commit();
		} finally {
			try{
				if(psDelUtente != null)
					psDelUtente.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}

	/**
	 * Ritorna un utente dal DB
	 */
	public synchronized static boolean getUser(String email) throws SQLException{
		Connection connection = null;
		PreparedStatement psDelUtente = null;

		try{
			connection = Database.getConnection();
			psDelUtente = connection.prepareStatement(queryGetUtente);
			psDelUtente.setString(1, email);

			psDelUtente.executeUpdate();

			connection.commit();
		} finally {
			try{
				if(psDelUtente != null)
					psDelUtente.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}


	/**
	 * Restituisce ,se esiste, un oggetto Utente data una email
	 */

	public synchronized static Utente getUtenteByID(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Utente utente = new Utente();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(queryGetUtente);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();

			connection.commit();

			while (rs.next()) {
				utente.setEmail(rs.getString("email"));
				utente.setNome(rs.getString("Nome"));
				utente.setCognome(rs.getString("Cognome"));
				utente.setPassword(rs.getString("Password"));
				utente.setSesso(rs.getString("Sesso"));
				utente.setFoto(rs.getString("Foto"));
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}
		if (utente.getEmail() == null)
			return null;
		else
			return utente;
	}
	
	/**
	 * Restituisce ,se esiste, tutti gli Utenti 
	 */

	public synchronized static ArrayList getUtentiAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		utenti = new ArrayList<>();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(queryGetUtenti);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Utente utente = new Utente();
				utente.setEmail(rs.getString("email"));
				utente.setNome(rs.getString("Nome"));
				utente.setCognome(rs.getString("Cognome"));
				utente.setPassword(rs.getString("Password"));
				utente.setSesso(rs.getString("Sesso"));
				utente.setFoto(rs.getString("Foto"));
				
				utenti.add(utente);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}
		return utenti;
	}
	
	/**
	 * Recupera un admin dal DB
	 */
	
	public synchronized static Admin getAdmin(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Admin admin = new Admin();

		try {
			connection = Database.getConnection();
			preparedStatement = connection.prepareStatement(queryGetAdmin);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();

			connection.commit();

			while (rs.next()) {
				admin.setUserName(rs.getString("idadmin"));
				admin.setPassword(rs.getString("PasswordAdmin"));

			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}
		if (admin.getUserName() == null)
			return null;
		else
			return admin;
	}

	/**
	 * Registra un prodotto nel database
	 */
	
	public synchronized static boolean addProdotto(Prodotto prodotto, String idUtente) throws SQLException{
		Connection connection = null;
		PreparedStatement psAddProdotto = null;

		try{
			connection = Database.getConnection();
			psAddProdotto = connection.prepareStatement(queryAddProdotto);
			psAddProdotto.setInt(1, prodotto.getIdProdotto());
			psAddProdotto.setString(2, prodotto.getDescrizione());
			psAddProdotto.setInt(3, prodotto.getQuantit�());
			psAddProdotto.setBigDecimal(4, prodotto.getPrezzo());
			psAddProdotto.setString(5, prodotto.getTipo());
			psAddProdotto.setString(6, prodotto.getNome());
			psAddProdotto.setString(7, idUtente);
			psAddProdotto.setString(8, prodotto.getPath());


			System.out.println(psAddProdotto.toString());

			psAddProdotto.executeUpdate();

			connection.commit();
			System.out.println("Insert Prodotto Connessione...");
		} finally {
			try{
				if(psAddProdotto != null)
					psAddProdotto.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}

	/**
	 * Elimina un prodotto nel database
	 */
	
	public synchronized static boolean delProdotto(int idProdotto) throws SQLException{
		Connection connection = null;
		PreparedStatement psDelProdotto = null;

		try{
			connection = Database.getConnection();
			psDelProdotto = connection.prepareStatement(queryEliminaProdotto);
			psDelProdotto.setInt(1, idProdotto);

			psDelProdotto.executeUpdate();

			connection.commit();
		} finally {
			try{
				if(psDelProdotto != null)
					psDelProdotto.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}

	/**
	 * Inserisce un ordine nella lista ordini dell'utente
	 */
	
	public synchronized static boolean addOrdine(Ordine ordine) throws SQLException{
		Connection connection = null;
		PreparedStatement psAddOrdine = null;

		try{
			connection = Database.getConnection();
			psAddOrdine = connection.prepareStatement(queryAddOrdine);
			
			psAddOrdine.setInt(1, ordine.getIdOrdine());
			psAddOrdine.setInt(2, ordine.getIdProdotto());
			psAddOrdine.setString(3, ordine.getIdUtente());
			psAddOrdine.setDate(4, ordine.getData());
			psAddOrdine.setString(5, ordine.getPagamento());
			psAddOrdine.setString(6, ordine.getIndirizzo());
			psAddOrdine.setString(7, ordine.getNote());
			psAddOrdine.setBigDecimal(8, ordine.getPrezzo());

			psAddOrdine.executeUpdate();

			connection.commit();
			System.out.println("Insert Ordine Connessione...");
		} finally {
			try{
				if(psAddOrdine != null)
					psAddOrdine.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}

	/**
	 * Ritorna la lista di tutti i prodotti presenti nel DB
	 */
	
	public synchronized static ArrayList getProdotti() throws SQLException{
		Connection connection = null;
		PreparedStatement psListProdotti= null;
		listProdotti = new ArrayList<>();
		try{
			connection = Database.getConnection();
			psListProdotti = connection.prepareStatement(queryGetProdotti);

			ResultSet rs = psListProdotti.executeQuery();

			while(rs.next()){
				Prodotto pr = new Prodotto();
				pr.setIdProdotto(rs.getInt("idProdotto"));
				pr.setDescrizione(rs.getString("Descrizione"));
				pr.setQuantit�(rs.getInt("Quantit�"));
				pr.setPrezzo(rs.getBigDecimal("PrezzoSingolo"));
				pr.setTipo(rs.getString("Tipo"));
				pr.setNome(rs.getString("Nome"));
				pr.setIdUtente(rs.getString("idUtente"));
				pr.setPath(rs.getString("Path"));

				listProdotti.add(pr);
			}

		}
		finally {
			try {
				if(psListProdotti != null)
					psListProdotti.close();
				if(psListProdotti !=null)
					psListProdotti.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return listProdotti;
	}
	
	public synchronized static ArrayList<Ordine> getByIdOrdine(String i) throws SQLException{
		Connection connection = null;
		PreparedStatement psListProdotti= null;
		ordini = new ArrayList<>();
		try 
		{
			connection= Database.getConnection();
			psListProdotti = connection.prepareStatement(queryGetMieiOrdiniById);
			psListProdotti.setString(1, i);
			ResultSet rs = psListProdotti.executeQuery();
			while (rs.next()) {
				Ordine ordine = new Ordine();
				ordine.setIdOrdine(rs.getInt("idOrdine"));
				ordine.setIdProdotto(rs.getInt("idProdotto"));
				ordine.setIdUtente(rs.getString("idUtente"));
				ordine.setData (rs.getDate("data"));
				ordine.setPagamento(rs.getString("pagamento"));
				ordine.setIndirizzo(rs.getString("indirizzo"));
				ordine.setNote(rs.getString("note"));
				ordine.setPrezzo(rs.getBigDecimal("prezzo"));
				ordini.add(ordine);
			}
		}
		finally {
			try {
				if(psListProdotti != null)
					psListProdotti.close();
				if(psListProdotti !=null)
					psListProdotti.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return ordini;
	}
	
	/**
	 * Ritorna la lista di tutti i prodotti di un utente nel DB
	 */
	
	public synchronized static ArrayList getProdottiUtente(String email) throws SQLException{
		Connection connection = null;
		PreparedStatement psListProdotti= null;
		listProdotti = new ArrayList<>();
		try{
			connection = Database.getConnection();
			psListProdotti = connection.prepareStatement(queryGetProdottoByUser);

			psListProdotti.setString(1, email);
			ResultSet rs = psListProdotti.executeQuery();

			while(rs.next()){
				Prodotto pr = new Prodotto();
				pr.setIdProdotto(rs.getInt("idProdotto"));
				pr.setDescrizione(rs.getString("Descrizione"));
				pr.setQuantit�(rs.getInt("Quantit�"));
				pr.setPrezzo(rs.getBigDecimal("PrezzoSingolo"));
				pr.setTipo(rs.getString("Tipo"));
				pr.setNome(rs.getString("Nome"));
				pr.setIdUtente(rs.getString("idUtente"));
				pr.setPath(rs.getString("Path"));

				listProdotti.add(pr);
			}

		}
		finally {
			try {
				if(psListProdotti != null)
					psListProdotti.close();
				if(psListProdotti !=null)
					psListProdotti.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return listProdotti;
	}
	
	/**
	 * Ritorna la lista di tutti gli ordini di un utente nel DB
	 */
	
	public synchronized static ArrayList getOrdiniUtente(String email) throws SQLException{
		Connection connection = null;
		PreparedStatement psListProdotti= null;
		listOrdini = new ArrayList<>();
		try{
			connection = Database.getConnection();
			psListProdotti = connection.prepareStatement(queryGetMieiOrdini);

			psListProdotti.setString(1, email);
			ResultSet rs = psListProdotti.executeQuery();

			while(rs.next()){
				Ordine or = new Ordine();
				or.setIdOrdine(rs.getInt("idOrdine"));
				or.setIdProdotto(rs.getInt("idProdotto"));
				or.setIdUtente(rs.getString("idUtente"));
				or.setData(rs.getDate("Data"));
				or.setPagamento(rs.getString("Pagamento"));
				or.setIndirizzo(rs.getString("Indirizzo"));
				or.setNote(rs.getString("Note"));
				or.setPrezzo(rs.getBigDecimal("Prezzo"));

				listOrdini.add(or);
			}
		}
		finally {
			try {
				if(psListProdotti != null)
					psListProdotti.close();
				if(psListProdotti !=null)
					psListProdotti.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return listOrdini;
	}

	/**
	 * Ritorna una lista di prodotti dal database data una keyword
	 */
	
	public synchronized static ArrayList cercaProdotti(String nomeProdotto) throws SQLException{
		Connection connection = null;
		PreparedStatement psListProdotti= null;
		cercaProdotti = new ArrayList<Prodotto>();
		try{
			connection = Database.getConnection();
			psListProdotti = connection.prepareStatement(queryCercaProdotto);

			psListProdotti.setString(1, nomeProdotto);
			ResultSet rs = psListProdotti.executeQuery();

			while(rs.next()){
				Prodotto pr = new Prodotto();
				pr.setIdProdotto(rs.getInt("idProdotto"));
				pr.setDescrizione(rs.getString("Descrizione"));
				pr.setQuantit�(rs.getInt("Quantit�"));
				pr.setPrezzo(rs.getBigDecimal("PrezzoSingolo"));
				pr.setTipo(rs.getString("Tipo"));
				pr.setNome(rs.getString("Nome"));
				pr.setIdUtente(rs.getString("idUtente"));
				pr.setPath(rs.getString("Path"));

				cercaProdotti.add(pr);
			}

		}
		finally {
			try {
				if(psListProdotti != null)
					psListProdotti.close();
				if(psListProdotti !=null)
					psListProdotti.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return cercaProdotti;
	}

	/**
	 * Ritorna un prodotto dato un id
	 */
	
	public synchronized static Prodotto getProdotto(int idProdotto) throws SQLException{
		Connection connection = null;
		PreparedStatement psGetProdotto= null;
		Prodotto pr = new Prodotto();

		try{
			connection = Database.getConnection();
			psGetProdotto = connection.prepareStatement(queryGetProdottoById);

			psGetProdotto.setInt(1, idProdotto);
			ResultSet rs = psGetProdotto.executeQuery();

			while(rs.next()){
				pr.setIdProdotto(rs.getInt("idProdotto"));
				pr.setDescrizione(rs.getString("Descrizione"));
				pr.setQuantit�(rs.getInt("Quantit�"));
				pr.setPrezzo(rs.getBigDecimal("PrezzoSingolo"));
				pr.setTipo(rs.getString("Tipo"));
				pr.setNome(rs.getString("Nome"));
				pr.setIdUtente(rs.getString("idUtente"));
				pr.setPath(rs.getString("Path"));

			}
		}
		finally {
			try {
				if(psGetProdotto != null)
					psGetProdotto.close();
				if(psGetProdotto !=null)
					psGetProdotto.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return pr;
	}
	
	/**
	 * Inserisce un prodotto nel carrello dell'utente
	 */
	
	public synchronized static boolean addCarrello(int idProdotto, String idUtente) throws SQLException{
		Connection connection = null;
		PreparedStatement psAddCarrello = null;

		try{
			connection = Database.getConnection();
			psAddCarrello = connection.prepareStatement(queryAddCarrello);

			psAddCarrello.setString(1, idUtente);
			psAddCarrello.setInt(2, idProdotto);
			
			psAddCarrello.executeUpdate();

			connection.commit();
			System.out.println("Inserimento nel carrello Connessione...: da " +idUtente);
		} finally {
			try{
				if(psAddCarrello != null)
					psAddCarrello.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}
	
	/**
	 * Ritorna il carrello di un utente dato un idUtente
	 */
	
	public synchronized static ArrayList getCarrello(String idUtente) throws SQLException{
		Connection connection = null;
		PreparedStatement psListCarrello= null;
		listCarrello = new ArrayList<>();
		
		
		try{
			connection = Database.getConnection();
			psListCarrello = connection.prepareStatement(queryGetCarrello);

			psListCarrello.setString(1, idUtente);
			ResultSet rs = psListCarrello.executeQuery();

			while(rs.next()){
				Carrello cr = new Carrello();
				cr.setIdUtente(rs.getString("idUtente"));
				cr.setIdProdotto(rs.getInt("idProdotto"));
				
				listCarrello.add(cr);
				cr = null;
			}

		}
		finally {
			try {
				if(psListCarrello != null)
					psListCarrello.close();
				if(psListCarrello !=null)
					psListCarrello.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return listCarrello;
	}
	
	/**
	 * Ritorna il numero di prodotti che un utente ha nel carrello
	 */
	
	public synchronized static int getCountCarrello(String idUtente) throws SQLException{
		Connection connection = null;
		PreparedStatement psGetNumCarrello= null;
		
		int valore = 0;
		
		try{
			connection = Database.getConnection();
			psGetNumCarrello = connection.prepareStatement(queryGetCarrello);

			psGetNumCarrello.setString(1, idUtente);
			ResultSet rs = psGetNumCarrello.executeQuery();
			
			while(rs.next()){
				
				valore++;
			}

		}
		finally {
			try {
				if(psGetNumCarrello != null)
					psGetNumCarrello.close();
				if(psGetNumCarrello !=null)
					psGetNumCarrello.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				connection.close();
				Database.releaseConnection(connection);
			}
		}
		return valore;
	}
	
	public synchronized static boolean updateQuantit�(String quantit�, String id1) throws SQLException{
		Connection connection = null;
		PreparedStatement pS = null;

		try{
			connection = Database.getConnection();
			pS = connection.prepareStatement(queryUpdateQuantit�);
			System.out.println(pS);
			pS.setString(1, quantit�);
			pS.setString(2, id1);
			System.out.println(pS);
			pS.executeUpdate();
			return true;
		} finally {
			try{
				if(pS != null)
					pS.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}
	}
	/**
	 * Elimina il carrello di un utente dal database
	 */
	public synchronized static boolean delCarrello(String email) throws SQLException{
		Connection connection = null;
		PreparedStatement psDelCarrello = null;

		try{
			connection = Database.getConnection();
			psDelCarrello = connection.prepareStatement(queryEliminaCarrello);
			psDelCarrello.setString(1, email);

			psDelCarrello.executeUpdate();

			connection.commit();
		} finally {
			try{
				if(psDelCarrello != null)
					psDelCarrello.close();
			} finally {
				Database.releaseConnection(connection);
			}
		}

		return true;
	}

	/**
	 * Query per il Database
	 */
	
	static {
		queryAddUtente = "INSERT INTO blacknoise.utente (email, Nome, Cognome, Password, Sesso, Foto) VALUES (?,?,?,?,?,?);";
		queryEliminaUtente = "DELETE FROM blacknoise.utente WHERE email = ?";
		queryGetUtente = "SELECT * FROM blacknoise.utente WHERE email=?";
		queryAddProdotto = "INSERT INTO blacknoise.prodotto (idProdotto, Descrizione, Quantit�, PrezzoSingolo, Tipo, Nome, idUtente, Path) VALUES (?,?,?,?,?,?,?,?);";
		queryEliminaProdotto = "DELETE FROM blacknoise.prodotto WHERE idProdotto = ?";
		queryGetProdotti = "SELECT * FROM blacknoise.prodotto";
		queryGetMieiOrdini = "SELECT * FROM blacknoise.ordine WHERE idUtente = ?";
		queryGetMieiOrdiniById = "SELECT * FROM blacknoise.ordine WHERE idUtente = ?";
		queryCercaProdotto = "SELECT * FROM blacknoise.prodotto WHERE Nome = ?";
		queryGetProdottoById ="SELECT * FROM blacknoise.prodotto WHERE idProdotto = ?";
		queryGetProdottoByUser ="SELECT * FROM blacknoise.prodotto WHERE idUtente = ?";
		queryAddCarrello = "INSERT INTO blacknoise.carrello (idUtente, idProdotto) VALUES (?, ?)";
		queryAddOrdine = "INSERT INTO blacknoise.ordine (idOrdine, idProdotto, idUtente, Data, Pagamento, Indirizzo, Note, Prezzo) VALUES (?,?,?,?,?,?,?,?)";
		queryGetCarrello = "SELECT * FROM blacknoise.carrello WHERE idUtente = ?";
		queryEliminaCarrello = "DELETE FROM blacknoise.carrello WHERE idUtente = ?";
		queryGetNumeroProdotto = "SELECT * FROM blacknoise.carrello WHERE idUtente = ?";
		queryGetUtenti = "SELECT * FROM blacknoise.utente";
		queryGetAdmin = "SELECT * FROM blacknoise.admin WHERE Email = ?";
		queryUpdateQuantit� = "UPDATE blacknoise.prodotto SET Quantit� = ? WHERE idProdotto = ?";
	}
	
}
