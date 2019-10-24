
package Beans;

import java.math.BigDecimal;

public class Prodotto {
	private int idProdotto;
	private String descrizione;
	private int quantit�;
	private BigDecimal prezzo;
	private String tipo;
	private String condizione;
	private String nome;
	private String path;
	private String idUtente;
	
	public Prodotto() {}

	public Prodotto(int idProdotto, String descrizione, int quantit�, BigDecimal prezzo, String tipo, String condizione, String nome, String path, String utente) {
		super();
		this.idProdotto = idProdotto;
		this.descrizione = descrizione;
		this.quantit� = quantit�;
		this.prezzo = prezzo;
		this.tipo = tipo;
		this.condizione = condizione;
		this.nome = nome;
		this.path = path;
		this.idUtente = utente;
	}

	public int getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getQuantit�() {
		return quantit�;
	}

	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}

	public BigDecimal getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(BigDecimal prezzo) {
		this.prezzo = prezzo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getCondizione() {
		return condizione;
	}

	public void setCondizione(String condizione) {
		this.condizione = condizione;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setPath(String path){
		this.path = path;
	}
	
	public String getUtente(){
		return idUtente;
	}
	
	public void setIdUtente(String utente){
		this.idUtente = utente;
	}


	@Override
	public String toString() {
		return "Prodotto [idProdotto=" + idProdotto + ", descrizione=" + descrizione + ", quantit�=" + quantit�
				+ ", prezzo=" + prezzo + ", tipo=" + tipo + ", condizione=" + condizione + "]";
	}
	
	
}
