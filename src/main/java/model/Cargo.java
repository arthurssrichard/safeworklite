package model;

public class Cargo {
	private int ID;
	private String nome;
	private String descricao;
	private int ID_setor;
	
	
	

	public Cargo(String nome, String descricao, int iD_setor) {
		super();
		this.nome = nome;
		this.descricao = descricao;
		this.ID_setor = iD_setor;
	}

	public Cargo(int ID, String nome, String descricao) {
		this.ID = ID;
		this.nome = nome;
		this.descricao = descricao;
	}
	
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
	
	public int getID_setor() {
		return ID_setor;
	}

	public void setID_setor(int iD_setor) {
		ID_setor = iD_setor;
	}
	
}
