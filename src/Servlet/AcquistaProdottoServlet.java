package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Carrello;
import Beans.Ordine;
import Beans.Prodotto;
import Beans.Utente;
import Database.DatabaseQuery;


@WebServlet("/AcquistaProdottoServlet")
public class AcquistaProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AcquistaProdottoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Utente u = (Utente) session.getAttribute("user");
		
		String email =  u.getEmail();
		
		String Pagamento = request.getParameter("pagamento");
		System.out.println(Pagamento);
		
		String Indirizzo = request.getParameter("indirizzo"); 
		System.out.print(Indirizzo);
		
		String Descrizione = request.getParameter("descrizione");
		System.out.println(Descrizione);
		
		Calendar data = new GregorianCalendar();
		int day = data.get(Calendar.DAY_OF_MONTH);
		int mese = data.get(Calendar.MONTH);
		int anno = data.get(Calendar.YEAR);
		@SuppressWarnings("deprecation")
		Date data2 = new Date(anno,mese,day);
		ArrayList<Carrello> lista = new ArrayList<>();
		boolean b = false;
		String id1 = request.getParameter("id_p");
		System.out.println(id1);
		String Quantità = request.getParameter("prod");
		System.out.println(Quantità);
		try {
			lista = DatabaseQuery.getCarrello(email);
			b = DatabaseQuery.updateQuantità(Quantità, id1);
			System.out.println("Expected true:"+b);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(lista);
		
		for (int i = 0; i < lista.size(); i++) {
			try {
				Prodotto p = DatabaseQuery.getProdotto(lista.get(i).getIdProdotto());
				Ordine o = new Ordine(p.getIdProdotto(), p.getIdProdotto(), email, data2, Pagamento, Indirizzo, Descrizione,  p.getPrezzo());
				System.out.println(o);
				DatabaseQuery.addOrdine(o);
				p=null;
				o=null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
			
			try {
				DatabaseQuery.delCarrello(email);
				request.getRequestDispatcher("Profilo.jsp").forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("ERRORE INSERIMENTO (Ordine già  presente)");
				request.getRequestDispatcher("Profilo.jsp").forward(request, response);

			}
		}		
		
		request.getRequestDispatcher("Profilo.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
