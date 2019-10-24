package Servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Admin;
import Beans.Prodotto;
import Beans.Utente;
import Database.DatabaseQuery;


/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet("/AddProdottoServlet")
public class AddProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProdottoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		HttpSession session = request.getSession();
		Admin a = (Admin) session.getAttribute("admin");
		
		String Nome = request.getParameter("prodotto_nome");
		System.out.println(Nome);
		
		String Tipo = request.getParameter("prodotto_tipo"); 
		System.out.print(Tipo);
		
		String Descrizione = request.getParameter("prodotto_descrizione");
		System.out.println(Descrizione);
		
		String quantit� = request.getParameter("prodotto_quantita");
		int Quantit� = Integer.parseInt(quantit�);
		System.out.println(Quantit�);
		
		String prezzo = request.getParameter("prodotto_prezzo");
		Double price = Double.parseDouble(prezzo);
		BigDecimal Prezzo = BigDecimal.valueOf(price);
		System.out.println(Prezzo);
		
		String Condizione = request.getParameter("prodotto_codizione");
		System.out.println(Condizione);
		
		String Path = request.getParameter("prodotto_path");
		System.out.println(Path);	
		
		Prodotto prodotto = new Prodotto(0, Descrizione, Quantit�, Prezzo, Tipo, Condizione, Nome, Path, null);
		System.out.println(prodotto);
		
		try {
			if(a == null) {
				System.out.println("Utente non loggato prodotto non inserito, jsp di errore.");
				request.getRequestDispatcher("InvitoLogReg.jsp").forward(request, response);
			} else  {
					DatabaseQuery.addProdotto(prodotto, a.getUserName());
					System.out.println("Prodotto aggiunto da: " + a.getUserName());
					request.getRequestDispatcher("AdminProdotto.jsp").forward(request, response);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
