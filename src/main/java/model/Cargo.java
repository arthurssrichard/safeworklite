package model;

public class Cargo {
	private int ID;
	private String nome;
	private String descricao;
	
	
	
	public Cargo(int iD, String nome, String descricao) {
		super();
		ID = iD;
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
