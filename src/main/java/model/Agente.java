package model;

public class Agente {
	private int ID;
	private Risco risco;
	private String nome;
	private String observacao;
	
	public Agente(){
		
	}

	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public Risco getRisco() {
		return risco;
	}
	public void setRisco(Risco risco) {
		this.risco = risco;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
}	
