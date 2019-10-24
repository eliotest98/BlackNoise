package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Ordine;
import Beans.Prodotto;
import Beans.Utente;
import Database.DatabaseQuery;

/**
 * Servlet implementation class GetProdottoFattura
 */
@WebServlet("/GetProdottoFattura")
public class GetProdottoFattura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProdottoFattura() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Ordine> lista = new ArrayList<Ordine>();
		ArrayList<Prodotto> lista2 = new ArrayList<Prodotto>();
		HttpSession session = request.getSession();		
		Utente i = (Utente) session.getAttribute("user");
		System.out.println(i);
		try {	

			lista=DatabaseQuery.getByIdOrdine(i.getEmail());
			for(int i1=0;i1<lista.size();i1++) {
			lista2=DatabaseQuery.getProdottiUtente(lista.get(i1).getIdUtente());
			System.out.println(DatabaseQuery.getProdottiUtente(lista.get(i1).getIdUtente()));
			}
			request.setAttribute("lista2",lista2);
			request.setAttribute("lista", lista);
			System.out.println(lista);
			System.out.println(lista2);
			if(lista == null & lista2 == null)
			{
				request.setAttribute("vis", "nulla");
			} 
			else
			{
				request.setAttribute("vis", "visible");
			}
			request.getRequestDispatcher("Fattura.jsp").forward(request, response);

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
