package model;

public class Cargo {
	private int ID;
	private String nome;
	private String descricao;
	
	
	
	public Cargo(String nome, String descricao) {
		this.nome = nome;
		this.descricao = descricao;
	}
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
}
